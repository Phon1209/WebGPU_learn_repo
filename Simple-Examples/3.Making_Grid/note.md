# Rendering A Grid

## Uniforms

Look like a variable that can be passed to shader.
Uniform will be the same for for every invocation.

Uniform need to be binded to the shader using `@group` and `@binding`.

## Instancing

Draw multiple instance of the same geometry with different transformation.

`instance_index` can be used to get the index of the instance.
it's 0 based.
