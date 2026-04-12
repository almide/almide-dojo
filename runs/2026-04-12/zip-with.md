# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 2 previous errors; 2 warnings emitted

FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  xs.zip(ys).map((p) => f(p._1, p._2))
```
