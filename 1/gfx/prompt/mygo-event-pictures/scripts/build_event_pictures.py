from __future__ import annotations

import argparse
import struct
from pathlib import Path

from PIL import Image


WIDTH = 448
HEIGHT = 148
DDS_FLAGS = 0x0002100F


def center_crop(image: Image.Image) -> Image.Image:
    target_ratio = WIDTH / HEIGHT
    source_ratio = image.width / image.height

    if source_ratio > target_ratio:
        crop_width = round(image.height * target_ratio)
        left = (image.width - crop_width) // 2
        box = (left, 0, left + crop_width, image.height)
    else:
        crop_height = round(image.width / target_ratio)
        top = (image.height - crop_height) // 2
        box = (0, top, image.width, top + crop_height)

    return image.crop(box).resize((WIDTH, HEIGHT), Image.Resampling.LANCZOS)


def patch_stellaris_dds_header(path: Path) -> None:
    data = bytearray(path.read_bytes())
    if data[:4] != b"DDS ":
        raise ValueError(f"Not a DDS file: {path}")

    struct.pack_into("<I", data, 8, DDS_FLAGS)
    struct.pack_into("<I", data, 20, WIDTH * 4)
    struct.pack_into("<I", data, 28, 1)
    path.write_bytes(data)


def build(source: Path, preview: Path, dds: Path) -> None:
    with Image.open(source) as opened:
        final = center_crop(opened.convert("RGBA"))

    preview.parent.mkdir(parents=True, exist_ok=True)
    dds.parent.mkdir(parents=True, exist_ok=True)
    final.save(preview, format="PNG", optimize=True)
    final.save(dds, format="DDS")
    patch_stellaris_dds_header(dds)

    with Image.open(dds) as check:
        if check.size != (WIDTH, HEIGHT):
            raise ValueError(f"Unexpected DDS dimensions: {dds} -> {check.size}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Build a 448x148 Stellaris ordinary-event PNG and DDS."
    )
    parser.add_argument("source", type=Path)
    parser.add_argument("preview", type=Path)
    parser.add_argument("dds", type=Path)
    args = parser.parse_args()
    build(args.source, args.preview, args.dds)


if __name__ == "__main__":
    main()

