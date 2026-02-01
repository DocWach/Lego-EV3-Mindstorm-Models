# LEGO EV3 Mindstorms — Reusable Parts Library

## Overview

A reusable parts library for the LEGO Mindstorms EV3 platform, containing 172 components across three data layers:

| Layer | Format | Purpose |
|---|---|---|
| **Parts data** | JSON | Machine-readable catalog with LDraw IDs, materials, categories |
| **Kit inventories** | JSON | Set inventories (45544, 45560) with quantities and colors |
| **SysML v2 models** | `.sysml` | Behavioral models, requirements, system architecture |
| **Geometry** | LDraw `.dat` | 3D part geometry (downloaded separately from LDraw.org) |

Parts are identified by **LDraw part numbers** (e.g., `2780`, `95646`), not internal PLM identifiers. This makes the library reusable across different PLM systems, CAD tools, and educational projects.

## Repository Structure

```
Lego-EV3-Mindstorm-Models/
├── data/
│   ├── parts.json              # 172 parts with LDraw IDs, categories, materials
│   └── kits/
│       ├── 45544.json          # Education Core Set (541 pcs, 108 lines)
│       └── 45560.json          # Expansion Set (853 pcs, 143 lines)
├── sysml/                      # SysML v2 behavioral models
│   ├── EV3Library.sysml
│   ├── EV3System.sysml
│   ├── axles/
│   ├── behavior/
│   ├── connectors/
│   ├── domain/
│   ├── electronics/
│   ├── gears/
│   ├── hardware/
│   ├── kits/
│   ├── other/
│   ├── requirements/
│   ├── structural/
│   └── wheels/
├── geometry/                   # LDraw .dat files (download separately)
│   └── README.md
└── README.md
```

## Parts Data

### data/parts.json

172 parts cataloged with granular categories:

| Category | Count | Examples |
|---|---|---|
| `electronics-brick` | 1 | EV3 Programmable Brick |
| `electronics-motor` | 2 | Large Servo Motor, Medium Servo Motor |
| `electronics-sensor` | 4 | Color, Touch, Ultrasonic, Gyro |
| `electronics-battery` | 1 | Rechargeable Battery |
| `electronics-cable` | 4 | 25cm, 35cm, 50cm, USB 2m |
| `axle` | 17 | Axle 2 through Axle 12, with variants |
| `connector-pin` | 13 | Friction pins, long pins, pegs |
| `connector-axle` | 4 | Axle connectors, axle-to-pin |
| `bushing` | 4 | Half bushing, bushing, module bush |
| `beam-straight` | 16 | Beam 2 through Beam 15 |
| `beam-angular` | 12 | Bent beams, T-shaped, triangles |
| `beam-frame` | 4 | Frames 5x7, 5x11, ball joint, bearing |
| `cross-block` | 12 | Various cross blocks and connectors |
| `angle-connector` | 5 | 0° through 180° connectors |
| `gear-spur` | 5 | 8T, 16T, 24T, 40T, 4-knob |
| `gear-bevel` | 6 | 12T, 20T bevel gears and halves |
| `gear-special` | 4 | Worm, rack, sprocket, differential |
| `wheel-rim` | 9 | Rims, turntables, wheel bearings |
| `wheel-tire` | 12 | Tires, treads, V-belts, rubber bands |
| `panel` | 14 | Curved panels in various sizes |
| `specialty` | 23 | Levers, plates, hoses, decorative |

Each part record:
```json
{
  "ldraw": "2780",
  "ldrawFile": "2780.dat",
  "name": "Technic Pin with Short Friction Ridges",
  "category": "connector-pin",
  "material": "ABS",
  "source": {
    "name": "BrickLink/BrickOwl",
    "geometry": "LDraw",
    "material": "industry-knowledge"
  }
}
```

### Kit Inventories

Each kit file lists parts by LDraw number with quantities and color notes:

| Kit | Set # | Pieces | Lines | Focus |
|---|---|---|---|---|
| Education Core | 45544 | 541 | 108 | Full system: brick, motors, sensors, structural |
| Expansion | 45560 | 853 | 143 | Additional structural, gears, wheels, specialty |

## SysML v2 Models

The `sysml/` directory contains behavioral and architectural models:

- **Domain** — Type definitions, enumerations, port interfaces
- **Hardware** — EV3 brick, motors, sensors with real specifications
- **Behavior** — 22 actions, 6 state machines, 12 calculations (PID, odometry)
- **Requirements** — 25+ requirements and constraints
- **System** — 7 robot configuration templates (driving, line following, balancing, etc.)
- **Kits** — Set-level part definitions for 45544, 45560, and 31313

See the [SysML models README](sysml/) for detailed usage and examples.

## Geometry

LDraw `.dat` files provide 3D geometry for each part. Due to size (~80 MB), they are not included directly. See [`geometry/README.md`](geometry/README.md) for download instructions.

## Integration with PLMr

This library is designed to be consumed by [PLMr](https://github.com/DocWach/PLMr), a PLM co-pilot for engineering education. PLMr assigns its own internal part numbers (`PRT-#####`) and converts LDraw geometry to STEP AP242 format — creating a realistic PLM integration exercise where students must map between vendor identifiers and enterprise numbering.

## Data Sources

| Source | What it provides |
|---|---|
| [LDraw.org](https://www.ldraw.org/) | Part geometry, part numbers, `.dat` file format |
| [BrickLink](https://www.bricklink.com/) | Part names, categories, colors, set inventories |
| [BrickOwl](https://www.brickowl.com/) | Cross-reference names and categories |
| [Brickset](https://brickset.com/) | Set-level inventory and piece counts |
| Industry knowledge | Material compositions (ABS, PVC/Copper, Rubber/TPE, Steel) |

## License

SysML models and data files are provided for educational and research purposes. LEGO and Mindstorms are trademarks of the LEGO Group. LDraw geometry is available under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/).
