
@group(0) @binding(0) var<uniform> grid: vec2f;
@group(0) @binding(1) var<storage> cellStateIn: array<u32>;
@group(0) @binding(2) var<storage, read_write> cellStateOut: array<u32>;


// Helper function to get the 1D index from a 2D coordinate
fn cellIndex(cell: vec2u) -> u32 {
  return cell.y * u32(grid.x) + cell.x;
}

@compute  
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) cell: vec3u) {
// global_invocation_id will be in the form of (x, y, 0)
cellStateOut[cellIndex(cell.xy)] = 1 - cellStateIn[cellIndex(cell.xy)];
}