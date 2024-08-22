# To compile
# capnp compile -o c++:cpp_iface power_system.capnp
# capnp compile -o rust:rust_iface power_system.capnp

@0xbb9522c5207dc1ef;

struct GeneratorState {
    voltA @0 :Float32;
    voltB @1 :Float32;
    voltC @2 :Float32;

    angleA @3 :Float32;
    angleB @4 :Float32;
    angleC @5 :Float32;

    real @6 :Float32;
    react @7 :Float32;
}

struct Generator {
    id @0 :Text;
    name @1 :Text;
    feeder @2 :Text;
    phases @3 :Text;
    positionX @4 :Float64;
    positionY @5 :Float64;
    data @6 :List(GeneratorState);

    voltageDivisor @7 :Float64 = 1.0;
    wattageDivisor @8 :Float64 = 1.0;
    varsDivisor @9 :Float64 = 1.0;
}

struct TransformerState {
    voltAFrom @0 :Float32;
    voltBFrom @1 :Float32;
    voltCFrom @2 :Float32;

    voltATo @3 :Float32;
    voltBTo @4 :Float32;
    voltCTo @5 :Float32;

    tapA @6 :Int32;
    tapB @7 :Int32;
    tapC @8 :Int32;

    tapChangesA @9 :Int32;
    tapChangesB @10 :Int32;
    tapChangesC @11 :Int32;
}

struct Transformer {
    id @0 :Text;
    name @1 :Text;
    feeder @2 :Text;
    positionX @3 :Float64;
    positionY @4 :Float64;
    data @5 :List(TransformerState);
    toNode @6 :Text;
    fromNode @7 :Text;

    voltageDivisor @8 :Float64 = 1.0;
    wattageDivisor @9 :Float64 = 1.0;
    varsDivisor @10 :Float64 = 1.0;
}

struct LineState {
    voltAFrom @0 :Float32;
    voltBFrom @1 :Float32;
    voltCFrom @2 :Float32;

    voltATo @3 :Float32;
    voltBTo @4 :Float32;
    voltCTo @5 :Float32;

    realAFrom @6 :Float32;
    realBFrom @7 :Float32;
    realCFrom @8 :Float32;

    realATo @9 :Float32;
    realBTo @10 :Float32;
    realCTo @11 :Float32;

    reactAFrom @12 :Float32;
    reactBFrom @13 :Float32;
    reactCFrom @14 :Float32;

    reactATo @15 :Float32;
    reactBTo @16 :Float32;
    reactCTo @17 :Float32;
}

struct Line {
    id @0 :Text;
    name @1 :Text;
    feeder @2 :Text;
    phases @3 :Text;
    data @4 :List(LineState);
    toNode @5 :Text;
    fromNode @6 :Text;

    length @7 :Float64;
    distanceA @8 :Float64;
    distanceB @9 :Float64;
    positionStartX @10 :Float64;
    positionStartY @11 :Float64;
    positionEndX @12 :Float64;
    positionEndY @13 :Float64;

    voltageDivisor @14 :Float64 = 1.0;
    wattageDivisor @15 :Float64 = 1.0;
    varsDivisor @16 :Float64 = 1.0;
}

struct PowerSystemDataset {
    id @0 :Text;
    name @1 :Text;
    lines @2 :List(Line);
    generators @3 :List(Generator);
    transformers @4 :List(Transformer);
}
