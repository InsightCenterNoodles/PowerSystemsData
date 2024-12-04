# Power System Visualization Data Format

This repository defines a **standardized data format** for representing power system datasets, with a focus on supporting **time-series visualizations** and **3D visualization tools**. By providing a consistent and extensible structure, this format aims to streamline the development and interoperability of visualization codebases in the power systems domain.


## Overview

The Cap’n Proto schemas in this repository describe the key elements of a power system, including:

- **Generators**: Representing power generation units with time-series data for voltage, power, and angles.
- **Transformers**: Including tap positions and voltage states on both sides of the transformer.
- **Lines**: Representing power lines with per-phase voltage, real and reactive power flows, and line loading data.
- **Floor Plans**: Allowing for the integration of geographical or schematic maps.
- **Annotations**: Providing metadata or visual cues at specific locations on the map.

The data format is designed to handle **normalized coordinates** and provide flexibility for alternate mapping systems, making it suitable for a variety of visualization scenarios.


## Key Features

1. **Time-Series Support**  
   The format supports time-series data for dynamic visualizations of key metrics such as voltage, real power (kW), and reactive power (kVars).

2. **3D Visualization Ready**  
   By integrating coordinates and normalization options, this format is ideal for rendering power systems in 3D environments.

3. **Extensible Design**  
   Built on Cap’n Proto, the schema can be easily extended to accommodate additional data types or application-specific requirements.

4. **Interoperability**  
   This format acts as a bridge for different tools and codebases to work with a shared understanding of the data structure.

## Schema Highlights

### `Generator`

Defines power generation units and their time-series data, including:
- Phase voltages (kW)
- Voltage angles
- Real and reactive power output (kW and kVars)

### `Transformer`

Describes transformers with details like:
- Phase voltage states (on "from" and "to" sides)
- Tap positions and tap change counts
- Associated time-series data

### `Line`

Represents power lines with:
- Voltage states (per phase, at both ends)
- Real and reactive power flows (per phase)
- Overall line loading and metadata

### `FloorPlan`

Supports both embedded images and external URLs for maps, with:
- Primary and alternate coordinates for mapping.

### `Annotation`

Allows for adding metadata or visual markers, supporting:
- Fixed textual content
- Time-series annotations
- Embedded or linked images
- 
## Getting Started

### Dependencies

You’ll need the [Cap’n Proto compiler](https://capnproto.org/) to use or modify the schemas in this repository. Install it using:

```bash
# On Ubuntu
sudo apt install capnproto

# On macOS
brew install capnp
```

### Compiling the Schemas
Compile the schemas to your desired target language using:

```bash
capnp compile -o c++:cpp_iface power_system.capnp
capnp compile -o rust:rust_iface power_system.capnp
```

### Integration
- Use the generated code in your application to load, process, and visualize power system datasets.
- Extend the schemas as needed to support additional features.