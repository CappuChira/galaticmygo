from __future__ import annotations

import argparse
import struct
from pathlib import Path

from PIL import Image


PALETTES = {
    "mygo_nomads": [
        (12, 30, 70),
        (111, 180, 235),
        (245, 247, 249),
        (25, 105, 210),
        (244, 91, 105),
    ],
    "mygo_popipa": [
        (218, 37, 60),
        (250, 185, 20),
        (248, 244, 225),
    ],
    "mygo_morfonica": [
        (36, 45, 145),
        (54, 201, 220),
        (247, 248, 245),
    ],
    "mygo_tsukinomori": [
        (11, 25, 58),
        (235, 238, 242),
        (74, 49, 140),
    ],
}


def nearest(rgb: tuple[int, int, int], palette: list[tuple[int, int, int]]) -> tuple[int, int, int]:
    return min(
        palette,
        key=lambda color: sum((rgb[index] - color[index]) ** 2 for index in range(3)),
    )


def flatten(master: Image.Image, palette: list[tuple[int, int, int]]) -> Image.Image:
    image = master.convert("RGBA")
    pixels = image.load()
    for y in range(image.height):
        for x in range(image.width):
            red, green, blue, alpha = pixels[x, y]
            if alpha == 0:
                pixels[x, y] = (255, 255, 255, 0)
            else:
                flat = nearest((red, green, blue), palette)
                pixels[x, y] = (*flat, alpha)
    return image


def patch_reference_dds_header(path: Path) -> None:
    data = bytearray(path.read_bytes())
    if data[:4] != b"DDS ":
        raise ValueError(f"Not a DDS file: {path}")
    struct.pack_into("<I", data, 8, 0x0002100F)
    struct.pack_into("<I", data, 28, 1)
    path.write_bytes(data)


def write_dds(image: Image.Image, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    image.convert("RGBA").save(path)
    patch_reference_dds_header(path)


def build_one(identifier: str, batch: Path, output_root: Path) -> None:
    master_path = batch / "cutout" / f"{identifier}_master.png"
    main = flatten(Image.open(master_path), PALETTES[identifier]).resize(
        (256, 256), Image.Resampling.LANCZOS
    )
    alpha = main.getchannel("A")
    map_image = Image.new("RGBA", main.size, (255, 255, 255, 0))
    map_image.putalpha(alpha)
    small = main.resize((24, 24), Image.Resampling.LANCZOS)

    filename = f"flag_{identifier}.dds"
    write_dds(main, output_root / filename)
    write_dds(map_image, output_root / "map" / filename)
    write_dds(small, output_root / "small" / filename)

    preview = batch / "preview"
    preview.mkdir(parents=True, exist_ok=True)
    main.save(preview / f"flag_{identifier}.png")
    map_image.save(preview / f"flag_{identifier}_map.png")
    small.resize((240, 240), Image.Resampling.NEAREST).save(
        preview / f"flag_{identifier}_small_10x.png"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--batch", type=Path, required=True)
    parser.add_argument("--output", type=Path, default=Path("1/flags/human"))
    parser.add_argument("--only", choices=sorted(PALETTES), action="append")
    args = parser.parse_args()

    identifiers = args.only or list(PALETTES)
    for identifier in identifiers:
        build_one(identifier, args.batch, args.output)

    for identifier in identifiers:
        filename = f"flag_{identifier}.dds"
        for path, expected_size in (
            (args.output / filename, 262272),
            (args.output / "map" / filename, 262272),
            (args.output / "small" / filename, 2432),
        ):
            actual = path.stat().st_size
            if actual != expected_size:
                raise ValueError(f"Unexpected DDS size for {path}: {actual} != {expected_size}")
    print("flag assets built and reference-format sizes verified")


if __name__ == "__main__":
    main()
