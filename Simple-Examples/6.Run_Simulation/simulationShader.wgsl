
@group(0) @binding(0) var<uniform> grid: vec2f;
@group(0) @binding(1) var<storage> cellStateIn: array<u32>;
@group(0) @binding(2) var<storage, read_write> cellStateOut: array<u32>;


// Helper function to get the 1D index from a 2D coordinate
fn cellIndex(cell: vec2u) -> u32 {
  return cell.y * u32(grid.x) + cell.x;
}

fn cellActive(x: u32, y: u32) -> u32 {
  if (x >= u32(grid.x) || y >= u32(grid.y) || x < 0u || y < 0u) {
    return 0u;
  }
  let index = cellIndex(vec2u(x, y));
  return cellStateIn[index];
}

@compute  
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) cell: vec3u) {
// global_invocation_id will be in the form of (x, y, 0)
  let activeNeighbors = cellActive(cell.x+1, cell.y+1) +
                                  cellActive(cell.x+1, cell.y) +
                                  cellActive(cell.x+1, cell.y-1) +
                                  cellActive(cell.x, cell.y-1) +
                                  cellActive(cell.x-1, cell.y-1) +
                                  cellActive(cell.x-1, cell.y) +
                                  cellActive(cell.x-1, cell.y+1) +
                                  cellActive(cell.x, cell.y+1);

  let currentIndex = cellIndex(cell.xy);

  switch activeNeighbors {
    case 2u: {
      // Stay the same
      cellStateOut[currentIndex] = cellStateIn[currentIndex];
    }
    case 3u: {
      // Become active
      cellStateOut[currentIndex] = 1u;
    }
    default: {
      // Become inactive
      cellStateOut[currentIndex] = 0u;
    }
  }

}