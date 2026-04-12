# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd
error[E005]: argument 'f' expects fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd:2:40
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(list.zip(xs, ys), (x, y) => f(x, y))
  |                                        ^
error[E001]: type mismatch in call to list.map(): expected fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd:2:40
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(xs, ys), (x, y) => f(x, y))
  |                                        ^

2 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-zip-with-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  list.map(list.zip(xs, ys), (x, y) => f(x, y))
```
