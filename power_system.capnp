# To compile
# capnp compile -o c++:cpp_iface power_system.capnp
# capnp compile -o rust:rust_iface power_system.capnp

@0xbb9522c5207dc1ef;

# Represents the state of a generator at a specific point in time.
struct GeneratorState {
    voltA @0 :Float32;  # Voltage for phase A.
    voltB @1 :Float32;  # Voltage for phase B.
    voltC @2 :Float32;  # Voltage for phase C.

    angleA @3 :Float32; # Voltage angle for phase A.
    angleB @4 :Float32; # Voltage angle for phase B.
    angleC @5 :Float32; # Voltage angle for phase C.

    real @6 :Float32;   # Real power (kW).
    react @7 :Float32;  # Reactive power (kVAr).
}

# Represents a power system generator and its attributes.
struct Generator {
    id @0 :Text;                      # Unique identifier.
    name @1 :Text;                    # Generator name.
    feeder @2 :Text;                  # Feeder name associated with this generator.
    phases @3 :Text;                  # Operating phases (e.g., "ABC").
    positionX @4 :Float64;            # X-coordinate in the primary coordinate system.
    positionY @5 :Float64;            # Y-coordinate in the primary coordinate system.
    data @6 :List(GeneratorState);    # Time-series data for the generator's state.

    voltageDivisor @7 :Float64 = 1.0; # Normalization divisor for voltage.
    wattageDivisor @8 :Float64 = 1.0; # Normalization divisor for power (real).
    varsDivisor @9 :Float64 = 1.0;    # Normalization divisor for reactive power.

    # Normalized coordinates for alternate mapping systems.
    alternatePositionX @10 :Float64 = 0.0; 
    alternatePositionY @11 :Float64 = 0.0;

    type @12 :Text; # Generation type
}

# Represents the state of a transformer at a specific point in time.
struct TransformerState {
    voltAFrom @0 :Float32;  # Voltage on the "from" side for phase A.
    voltBFrom @1 :Float32;  # Voltage on the "from" side for phase B.
    voltCFrom @2 :Float32;  # Voltage on the "from" side for phase C.

    voltATo @3 :Float32;    # Voltage on the "to" side for phase A.
    voltBTo @4 :Float32;    # Voltage on the "to" side for phase B.
    voltCTo @5 :Float32;    # Voltage on the "to" side for phase C.

    tapA @6 :Int32;         # Tap position for phase A.
    tapB @7 :Int32;         # Tap position for phase B.
    tapC @8 :Int32;         # Tap position for phase C.

    tapChangesA @9 :Int32;  # Number of tap changes for phase A.
    tapChangesB @10 :Int32; # Number of tap changes for phase B.
    tapChangesC @11 :Int32; # Number of tap changes for phase C.
}

# Represents a transformer and its attributes.
struct Transformer {
    id @0 :Text;                      # Unique identifier.
    name @1 :Text;                    # Transformer name.
    feeder @2 :Text;                  # Feeder name associated with this transformer.
    positionX @3 :Float64;            # X-coordinate in the primary coordinate system.
    positionY @4 :Float64;            # Y-coordinate in the primary coordinate system.
    data @5 :List(TransformerState);  # Time-series data for the transformer's state.
    toNode @6 :Text;                  # Identifier for the "to" node.
    fromNode @7 :Text;                # Identifier for the "from" node.

    voltageDivisor @8 :Float64 = 1.0; # Normalization divisor for voltage.
    wattageDivisor @9 :Float64 = 1.0; # Normalization divisor for power (real).
    varsDivisor @10 :Float64 = 1.0;   # Normalization divisor for reactive power.

    # Normalized coordinates for alternate mapping systems.
    alternatePositionX @11 :Float64 = 0.0; 
    alternatePositionY @12 :Float64 = 0.0;
}

# Represents the state of a power line at a specific point in time.
struct LineState {
    voltAFrom @0 :Float32;  # Voltage on the "from" side for phase A.
    voltBFrom @1 :Float32;  # Voltage on the "from" side for phase B.
    voltCFrom @2 :Float32;  # Voltage on the "from" side for phase C.

    voltATo @3 :Float32;    # Voltage on the "to" side for phase A.
    voltBTo @4 :Float32;    # Voltage on the "to" side for phase B.
    voltCTo @5 :Float32;    # Voltage on the "to" side for phase C.

    realAFrom @6 :Float32;  # Real power on the "from" side for phase A.
    realBFrom @7 :Float32;  # Real power on the "from" side for phase B.
    realCFrom @8 :Float32;  # Real power on the "from" side for phase C.

    realATo @9 :Float32;    # Real power on the "to" side for phase A.
    realBTo @10 :Float32;   # Real power on the "to" side for phase B.
    realCTo @11 :Float32;   # Real power on the "to" side for phase C.

    reactAFrom @12 :Float32;# Reactive power on the "from" side for phase A.
    reactBFrom @13 :Float32;# Reactive power on the "from" side for phase B.
    reactCFrom @14 :Float32;# Reactive power on the "from" side for phase C.

    reactATo @15 :Float32;  # Reactive power on the "to" side for phase A.
    reactBTo @16 :Float32;  # Reactive power on the "to" side for phase B.
    reactCTo @17 :Float32;  # Reactive power on the "to" side for phase C.

    lineLoadRealA @18 :Float32; # Normalized real power load A for the line.
    lineLoadRealB @19 :Float32; # Normalized real power load B for the line.
    lineLoadRealC @20 :Float32; # Normalized real power load C for the line.
}

# Represents a power line and its attributes.
struct Line {
    id @0 :Text;                      # Unique identifier.
    name @1 :Text;                    # Line name.
    feeder @2 :Text;                  # Feeder name associated with this line.
    phases @3 :Text;                  # Operating phases (e.g., "ABC").
    data @4 :List(LineState);         # Time-series data for the line's state.
    toNode @5 :Text;                  # Identifier for the "to" node.
    fromNode @6 :Text;                # Identifier for the "from" node.

    length @7 :Float64;               # Line length in meters.
    distanceA @8 :Float64;            # Distance to phase A in meters.
    distanceB @9 :Float64;            # Distance to phase B in meters.
    positionStartX @10 :Float64;      # X-coordinate of the line's starting position.
    positionStartY @11 :Float64;      # Y-coordinate of the line's starting position.
    positionEndX @12 :Float64;        # X-coordinate of the line's ending position.
    positionEndY @13 :Float64;        # Y-coordinate of the line's ending position.

    voltageDivisor @14 :Float64 = 1.0;# Normalization divisor for voltage.
    wattageDivisor @15 :Float64 = 1.0;# Normalization divisor for power (real, kW).
    varsDivisor @16 :Float64 = 1.0;   # Normalization divisor for reactive power (kVars).

    maxReal @17 :Float64 = 1.0;       # Maximum allowable line load in kW.

    # Normalized coordinates for alternate mapping systems.
    alternatePositionStartX @18 :Float64 = 0.0; 
    alternatePositionStartY @19 :Float64 = 0.0;
    alternatePositionEndX @20 :Float64 = 0.0; 
    alternatePositionEndY @21 :Float64 = 0.0;
}

# Represents a floor plan or geographical map associated with the power system.
struct FloorPlan {
    lowerLeftX @0 :Float64;           # X-coordinate of the lower-left corner in primary coordinates.
    lowerLeftY @1 :Float64;           # Y-coordinate of the lower-left corner in primary coordinates.
    upperRightX @2 :Float64;          # X-coordinate of the upper-right corner in primary coordinates.
    upperRightY @3 :Float64;          # Y-coordinate of the upper-right corner in primary coordinates.

    union {                           # Union allows for an embedded image or a URL to the image.
        imageEmbedded @4 :Data;       # Embedded image data (e.g., a png or jpg).
        imageURL @5 :Text;            # URL pointing to the floor plan image.
    }
}

# Represents an annotation point on the power system map.
struct Annotation {
    positionX @0 :Float64; # X-coordinate of the annotation in primary coordinates.
    positionY @1 :Float64; # Y-coordinate of the annotation in primary coordinates.

    union {                           # Union allows various annotation types.
        fixedContent @2 :Text;        # Static textual annotation.
        timeseriesContent @3 :List(Text); # Time-series data (e.g., for graphing trends).
        imageEmbedded @4 :Data;      # Embedded image data for the annotation.
        imageURL @5 :Text;           # URL pointing to an annotation image.
    }

    # Normalized coordinates for alternate mapping systems.
    alternatePositionX @6 :Float64 = 0.0; 
    alternatePositionY @7 :Float64 = 0.0;
}

struct SwitchState {
    state @0 : Bool; # Open == true, closed == false
    fault @1 : Int8; # 0 -> Healthy, 1 -> faulted, 2-> shorted
    # other things to add?
    # control mode, voltage, current, thermals, switch count, last switch time
    # health?
}

# Represents an annotation point on the power system map.
struct Switch {
    id @0 :Text;           # Unique identifier.
    name @1 :Text;         # Line name.
    positionX @2 :Float64; # X-coordinate of the annotation in primary coordinates.
    positionY @3 :Float64; # Y-coordinate of the annotation in primary coordinates.

    data @4: List(SwitchState);

    # Normalized coordinates for alternate mapping systems.
    alternatePositionX @5 :Float64 = 0.0; 
    alternatePositionY @6 :Float64 = 0.0;
}

# Represents a complete power system dataset including generators, transformers, lines, and floor plans.
struct PowerSystemDataset {
    id @0 :Text;                      # Unique identifier for the dataset.
    name @1 :Text;                    # Name of the power system dataset.
    lines @2 :List(Line);             # Collection of power lines in the dataset.
    generators @3 :List(Generator);   # Collection of generators in the dataset.
    transformers @4 :List(Transformer); # Collection of transformers in the dataset.

    floorplan @5 :FloorPlan;          # Floor plan or map associated with the dataset.

    annotations @6 :List(Annotation); # Annotations (switches, etc).
}
