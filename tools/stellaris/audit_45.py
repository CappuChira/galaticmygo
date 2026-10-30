"""Read-only checks against the installed 4.5 vanilla scripts."""
from pathlib import Path
import difflib
import json
import re

ROOT = Path(__file__).resolve().parents[2]
MOD = ROOT / '1'
GAME = Path('F:/steam/steamapps/common/Stellaris')
version = json.loads((GAME / 'launcher-settings.json').read_text('utf-8'))['rawVersion']
assert version.startswith('v4.5.'), version
vanilla = (GAME / 'events/on_action_events_1.txt').read_text('utf-8').splitlines()
custom = (MOD / 'events/on_action_events_1.txt').read_text('utf-8').splitlines()
changes = []
for tag, a, b, c, d in difflib.SequenceMatcher(None, vanilla, custom, autojunk=False).get_opcodes():
    if tag == 'equal':
        continue
    before, after = vanilla[a:b], custom[c:d]
    portrait = (before == ['\t\tportrait = event_target:contact_empire']
                and after == ['\t\tportrait = event_target:contact_empire.ruler'])
    assert portrait or (tag == 'insert' and 'mygo' in '\n'.join(after)), (tag, a + 1, before, after)
    changes.append({'kind': 'MyGO portrait' if portrait else 'MyGO insertion', 'line': c + 1})
assert len(changes) == 8, changes
removed = re.compile(r'\b(pop_has_ethic|pop_group_has_ethic|min_navy_for_wars|ai_update_type|planet_max_buildings_add|planet_non_artificial_max_buildings_add|attraction_custom_title|attraction_custom_desc)\s*=')
action_keys = set(re.findall(r'(?m)^(\w+)\s*=\s*\{', (GAME / 'common/on_actions/00_on_actions.txt').read_text('utf-8')))
for directory in ('common', 'events', 'prescripted_countries'):
    for path in (MOD / directory).rglob('*.txt'):
        source = re.sub(r'(?m)#.*$', '', path.read_text('utf-8-sig'))
        assert not removed.search(source), str(path)
        if directory == 'common' and path.parent.name == 'on_actions':
            for key in re.findall(r'(?m)^(\w+)\s*=\s*\{', source):
                assert key in action_keys, (str(path), key)
for path in (ROOT / '1.mod', MOD / 'descriptor.mod'):
    assert 'supported_version="v4.5.*"' in path.read_text('utf-8')
for path in (MOD / 'localisation/simp_chinese').glob('*.yml'):
    assert path.read_bytes().startswith(b'\xef\xbb\xbf'), str(path)
print(json.dumps({'vanilla_version': version, 'override_changes': changes,
                  'removed_parameters': 'absent', 'on_actions': 'present in vanilla',
                  'localisation_bom': 'ok'}, ensure_ascii=False, indent=2))
