import { spawn, spawnSync } from 'node:child_process';
import { mkdirSync, writeFileSync } from 'node:fs';
import { dirname, resolve, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = resolve(dirname(fileURLToPath(import.meta.url)), '../..');
const game = process.env.STELLARIS_GAME_ROOT || 'F:/steam/steamapps/common/Stellaris';
const reports = join(root, '.local-tools/reports');
const repos = { scribe: 'RStellarScribe', gui: 'RStellarisGui' };
const env = { ...process.env, STELLARIS_GAME_ROOT: game, RSTELLARISCRIBE_GAME_ROOT: game,
  RSTELLARISCRIBE_DOCUMENTS_ROOT: resolve(root, '..') };
function paths(server) {
  if (!repos[server]) throw new Error('Server must be scribe or gui');
  const cwd = join(root, '.local-tools', repos[server]);
  return { cwd, entry: join(cwd, 'src/index.mjs') };
}
function cli(server, args) {
  const { cwd, entry } = paths(server);
  const result = spawnSync(process.execPath, [entry, '--skill', ...args],
    { cwd, env, encoding: 'utf8', timeout: 120000, maxBuffer: 32 * 1024 * 1024 });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(result.stderr || result.stdout || `Exit ${result.status}`);
  return JSON.parse(result.stdout.replace(/^\uFEFF/, ''));
}
function call(server, name, args) {
  mkdirSync(reports, { recursive: true });
  const input = join(reports, `${server}-${name}-args.json`);
  writeFileSync(input, JSON.stringify(args, null, 2));
  return cli(server, ['call-tool', name, '--json-file', input]);
}
async function handshake(server) {
  const { cwd, entry } = paths(server);
  return new Promise((accept, reject) => {
    const child = spawn(process.execPath, [entry], { cwd, env, windowsHide: true, stdio: ['pipe', 'pipe', 'pipe'] });
    let buffer = '', stderr = '', done = false;
    const finish = (error, value) => {
      if (done) return;
      done = true; clearTimeout(timer); child.kill();
      error ? reject(error) : accept(value);
    };
    const timer = setTimeout(() => finish(new Error(`${server}: handshake timeout ${stderr}`)), 30000);
    const send = (data) => child.stdin.write(JSON.stringify({ jsonrpc: '2.0', ...data }) + '\n');
    child.on('error', error => finish(error));
    child.on('exit', code => { if (!done) finish(new Error(`${server}: exit ${code} ${stderr}`)); });
    child.stdin.on('error', error => finish(error));
    child.stderr.on('data', data => { stderr += data; });
    child.stdout.on('data', data => {
      buffer += data;
      let end;
      while ((end = buffer.indexOf('\n')) >= 0) {
        const line = buffer.slice(0, end); buffer = buffer.slice(end + 1);
        if (!line.trim()) continue;
        try {
          const msg = JSON.parse(line);
          if (msg.error) throw new Error(JSON.stringify(msg.error));
          if (msg.id === 1) {
            if (!msg.result?.serverInfo) throw new Error('Missing serverInfo');
            send({ method: 'notifications/initialized' });
            send({ id: 2, method: 'tools/list', params: {} });
          } else if (msg.id === 2) {
            if (!msg.result?.tools?.length) throw new Error('Empty tool registry');
            finish(null, { server, protocol: 'stdio', tools: msg.result.tools.length });
          }
        } catch (error) { finish(error); }
      }
    });
    send({ id: 1, method: 'initialize', params: { protocolVersion: '2025-03-26',
      capabilities: {}, clientInfo: { name: 'mygo-tool-smoke', version: '1.0' } } });
  });
}
try {
  const [command, server, ...args] = process.argv.slice(2);
  let result;
  if (command === 'smoke') {
    result = [];
    for (const name of Object.keys(repos)) result.push(await handshake(name));
  } else if (command === 'validate') {
    result = call('scribe', 'validate_stellaris_project', { workspace_root: join(root, '1'), game_root: game });
    const output = join(reports, 'scribe-project.json');
    writeFileSync(output, JSON.stringify(result, null, 2));
    console.log(`Report: ${output}`);
  } else if (command === 'list') result = cli(server, ['list-tools']);
  else if (command === 'call' && args[0] && args[1]) {
    result = cli(server, ['call-tool', args[0], '--json-file', resolve(args[1])]);
  } else throw new Error('Usage: node tools/stellaris/run.mjs smoke | validate | list scribe|gui | call scribe|gui TOOL ARGS.json');
  console.log(JSON.stringify(result, null, 2));
  if (result?.isError || result?.verdict === 'errors' || result?.error_count > 0) process.exitCode = 1;
} catch (error) { console.error(error.message); process.exitCode = 1; }
