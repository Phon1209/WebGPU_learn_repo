
struct VertexInput {
  @location(0) pos: vec2f,
  @builtin(instance_index) instance: u32,
};

struct VertexOutput {
  @builtin(position) position: vec4f,
  @location(0) cell: vec2f,
};


@group(0) @binding(0) var<uniform> grid: vec2f;

@vertex
fn vertexMain(input: VertexInput) -> VertexOutput {

  let i = f32(input.instance);
  let cell = vec2f(i % grid.x, floor(i /grid.x));

  let cellOffset = cell / grid * 2;

  let scaledPosition = ((input.pos + 1) / grid) - 1 + cellOffset;
  var output : VertexOutput;
  output.position = vec4f(scaledPosition, 0.0, 1.0);
  output.cell = cell;
  return output;
}

@fragment
fn fragmentMain(input: VertexOutput) -> @location(0) vec4f {
  // Color based on cell position
  let cell = input.cell / grid;
  return vec4f(cell, 1 - cell.x / 2,1); 
}