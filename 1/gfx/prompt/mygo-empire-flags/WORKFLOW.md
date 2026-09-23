# MyGO empire flag workflow

本流程严格复刻参考 mod `3491727485` 的自定义国徽资产结构。

## 交付结构

每个国徽必须生成同名三件套：

- `1/flags/human/<name>.dds`：256×256 彩色主徽记。
- `1/flags/human/map/<name>.dds`：256×256 纯白地图徽记，alpha 轮廓与主图一致。
- `1/flags/human/small/<name>.dds`：24×24 彩色小徽记。

预设国通过以下结构引用：

```txt
empire_flag = {
	icon = {
		category = "human"
		file = "<name>.dds"
	}
	background = {
		category = "backgrounds"
		file = "00_solid.dds"
	}
	colors = {
		"<primary>"
		"<secondary>"
		"null"
		"null"
	}
}
```

## 图形要求

- 单一居中徽记，四周保留透明区。
- 使用 3–5 个纯色；禁止渐变、材质、光影、文字和复杂插画。
- 轮廓必须粗壮，缩至 24×24 后仍能识别。
- 主图和地图图必须共用相同 alpha 轮廓。
- DDS 为未压缩 32-bit RGBA，文件头包含 `DDSD_MIPMAPCOUNT` 且 mipmap count 为 1；256 图大小 262272 bytes，24 图大小 2432 bytes。

## 构建

母稿置于 `1/gfx/work/flags/<batch>/cutout/`，运行：

```powershell
$py='C:\Users\LemueDuck\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
& $py '1\gfx\prompt\mygo-empire-flags\scripts\build_flag_assets.py' --batch '1\gfx\work\flags\20260711-v01'
```

脚本会离散颜色、生成彩色主图、纯白地图图、24px 小图，并写出与参考 mod 头字段一致的 DDS。
单独重建某一国徽时追加 `--only mygo_nomads`、`--only mygo_popipa`、`--only mygo_morfonica` 或 `--only mygo_tsukinomori`。
