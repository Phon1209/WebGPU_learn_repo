# Drawing Geometric Shapes

## Clip Space

for 2D screen, clip space is a square relative to the canvas.
Always ranges from -1 to 1 in both x and y directions.

Will be mapped to pixel space when drawn to the canvas.

Note that GPU need vertex shader to transform vertex positions to clip space.

then determine which pixels are covered by the shape. after that, fragment shader will be run for each pixel to determine its color.

## Shader

A program that written by WebGPU developer using language like GLSL or WGSL.

### Vertex shader

A function/program that run for each vertex of the shape.
The purpose is to transform the vertex position to clip space.

In WGSL, the function must return a vec4f

- x,y,z,w
- x,y are the position in clip space
- z is the depth, used for depth testing
- w is used for perspective division, usually set to 1.0 for 2D shapes.

to write in WGSL:
you need to write `@vertex` before the function definition.

```wgsl
@vertex
fn vertexMain() -> @builtin(position) vec4f {
  // Stuff to convert to clip space
}
```

### Fragment shader

A program that run for each pixel covered by the shape.
Can be simply used to set the color of the pixel.
or can be used to implement complex effects like lighting, texture mapping, etc.

This is called after the vertex shader after rasterizing.
to write in WGSL:
you need to write `@fragment` before the function definition.

it also return `vec4f` representing RGBA color.

```wgsl
@fragment
fn fragmentMain() -> @location(0) vec4f {
  // Stuff to set the color of the pixel
}
```

### Index Buffer

to be understood more... before writing this.

### GPU Buffer

A memory space in GPU.

When initialized, it's zero-set. and cannot easily be read by the dev.
Most attribute are also immutable after creation.
