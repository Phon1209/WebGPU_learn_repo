
@group(0) @binding(0) var<uniform> grid: vec2f;

@vertex
fn vertexMain(@location(0) pos: vec2f, @builtin(instance_index) instance: u32) -> @builtin(position) vec4f {

  let i = f32(instance);
  let cell = vec2f(i % grid.x, floor(i /grid.x));

  let cellOffset = cell / grid * 2;

  let scaledPosition = ((pos + 1) / grid) - 1 + cellOffset;
  return vec4f(scaledPosition, 0.0, 1.0);
}

@fragment
fn fragmentMain() -> @location(0) vec4f {
  return vec4f(1,0,0,1); // Red color
}