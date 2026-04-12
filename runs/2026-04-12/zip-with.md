# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-zip-with-3.almd
Compile error for /tmp/dojo-zip-with-3.almd:
[1m[91merror[0m: could not compile `almide-out` (bin "almide-out" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  list.map(list.zip(xs, ys), (xy) => f(xy._1, xy._2))
```
