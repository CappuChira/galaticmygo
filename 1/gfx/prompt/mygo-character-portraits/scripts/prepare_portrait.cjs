#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

let sharp;
try {
  sharp = require("sharp");
} catch (error) {
  try {
    const moduleRoot = (process.env.NODE_PATH || "").split(path.delimiter)[0];
    const pnpmRoot = path.join(moduleRoot, ".pnpm");
    const sharpPackage = fs
      .readdirSync(pnpmRoot, { withFileTypes: true })
      .filter((entry) => entry.isDirectory() && entry.name.startsWith("sharp@"))
      .sort()
      .at(-1);
    if (!sharpPackage) throw error;
    sharp = require(path.join(pnpmRoot, sharpPackage.name, "node_modules", "sharp"));
  } catch (fallbackError) {
    console.error(
      "Cannot load sharp. Run with the bundled Codex Node.js runtime and set NODE_PATH to its node_modules directory."
    );
    console.error(fallbackError.stack || fallbackError.message);
    process.exit(2);
  }
}

function parseArgs(argv) {
  const result = {
    width: 700,
    height: 400,
    top: 70,
    bottom: 0,
    centerX: 350,
    alphaThreshold: 8,
  };

  for (let index = 0; index < argv.length; index += 1) {
    const key = argv[index];
    if (!key.startsWith("--")) {
      throw new Error(`Unexpected argument: ${key}`);
    }
    const name = key.slice(2);
    const value = argv[index + 1];
    if (value === undefined || value.startsWith("--")) {
      throw new Error(`Missing value for ${key}`);
    }
    result[name] = value;
    index += 1;
  }

  for (const key of [
    "width",
    "height",
    "top",
    "bottom",
    "centerX",
    "alphaThreshold",
  ]) {
    result[key] = Number(result[key]);
    if (!Number.isFinite(result[key])) {
      throw new Error(`Invalid numeric value for --${key}`);
    }
  }

  if (!result.input || !result.output) {
    throw new Error("Usage: prepare_portrait.cjs --input INPUT --output OUTPUT [--top 70 --centerX 350]");
  }
  return result;
}

function alphaBounds(data, width, height, channels, threshold) {
  let left = width;
  let top = height;
  let right = -1;
  let bottom = -1;

  for (let y = 0; y < height; y += 1) {
    for (let x = 0; x < width; x += 1) {
      const alpha = data[(y * width + x) * channels + 3];
      if (alpha <= threshold) continue;
      if (x < left) left = x;
      if (x > right) right = x;
      if (y < top) top = y;
      if (y > bottom) bottom = y;
    }
  }

  if (right < left || bottom < top) {
    throw new Error("No non-transparent portrait pixels were found.");
  }
  return { left, top, width: right - left + 1, height: bottom - top + 1 };
}

async function main() {
  const options = parseArgs(process.argv.slice(2));
  const input = path.resolve(options.input);
  const output = path.resolve(options.output);

  const decoded = await sharp(input)
    .ensureAlpha()
    .raw()
    .toBuffer({ resolveWithObject: true });
  const bounds = alphaBounds(
    decoded.data,
    decoded.info.width,
    decoded.info.height,
    decoded.info.channels,
    options.alphaThreshold
  );

  const availableHeight = options.height - options.top - options.bottom;
  if (availableHeight <= 0) {
    throw new Error("Top and bottom margins leave no usable portrait height.");
  }

  const scale = Math.min(options.width / bounds.width, availableHeight / bounds.height);
  const contentWidth = Math.max(1, Math.round(bounds.width * scale));
  const contentHeight = Math.max(1, Math.round(bounds.height * scale));
  const left = Math.max(
    0,
    Math.min(options.width - contentWidth, Math.round(options.centerX - contentWidth / 2))
  );
  const top = options.height - options.bottom - contentHeight;

  const content = await sharp(input)
    .ensureAlpha()
    .extract(bounds)
    .resize(contentWidth, contentHeight, { fit: "fill", kernel: sharp.kernel.lanczos3 })
    .png()
    .toBuffer();

  fs.mkdirSync(path.dirname(output), { recursive: true });
  await sharp({
    create: {
      width: options.width,
      height: options.height,
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 },
    },
  })
    .composite([{ input: content, left, top }])
    .png({ compressionLevel: 9, adaptiveFiltering: true })
    .toFile(output);

  console.log(
    JSON.stringify(
      {
        input,
        output,
        canvas: [options.width, options.height],
        sourceBounds: bounds,
        placedBounds: [left, top, left + contentWidth, top + contentHeight],
        scale,
      },
      null,
      2
    )
  );
}

main().catch((error) => {
  console.error(error.stack || error.message);
  process.exit(1);
});
