# Managing Cell State

It need something called storage buffer whcih another buffer type than Uniform buffer.

But Uniform buffer is limited in size = can't support dynamicaly sized arrays.
As well as cannot be written to by the compute shader.

In this case we want to compute the state in the compute shader = need to use storage buffer.

> why not just storage buffer for all use case?
> Because storage buffer is less optimized than uniform buffer. => for smaller amounts of data that have the potential to update frequently (like model, view, and projection matrices in 3D applications), uniforms are typically the safer choice for better performance.
