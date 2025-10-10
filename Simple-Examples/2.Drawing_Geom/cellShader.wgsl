

@vertex
fn vertexMain(@location(0) pos: vec2f) -> @builtin(position) vec4f {
  return vec4f(pos, 0.0, 1.0);
  // Also the same as:
  // return vec4f(pos.x, pos.y, 0.0, 1.0);
  // Since it's common in wgsl
}

@fragment
fn fragmentMain() -> @location(0) vec4f {
  return vec4f(1,0,0,1); // Red color
}