# LDraw Geometry Files

This directory is for LDraw `.dat` geometry files referenced by the parts in `data/parts.json`.

## Obtaining the LDraw Library

The LDraw parts library is open source (CC BY 2.0) and must be downloaded separately:

1. Visit https://www.ldraw.org/parts/latest-parts.html
2. Download the **Complete Library** (ldraw.zip, ~80 MB)
3. Extract to this directory so the structure is:

```
geometry/
├── parts/          # Main part files (e.g., 2780.dat)
├── p/              # Primitives referenced by parts
├── p/48/           # High-resolution primitives
└── models/         # Optional model files
```

## Converting to STEP

To convert LDraw geometry to STEP AP242 format for use in PLMr:

```bash
# From the PLMr repository
pip install cadquery
python scripts/ldraw_to_step.py \
  --ldraw-dir ../Lego-EV3-Mindstorm-Models/geometry \
  --from-plmr ./data/parts.json \
  --output ./cad/ \
  --plmr-naming
```

## Why not include .dat files directly?

The complete LDraw library is ~80 MB with thousands of primitives and subparts. Rather than vendoring the entire library, we reference parts by LDraw number and let users download the official library. This ensures you always have the latest corrected geometry.
