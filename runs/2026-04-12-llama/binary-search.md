# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:13:34
  in if branches
  hint: Fix the expression type or change the expected type
   |
13 |                     high = mid - 1,
   |                                  ^
error[E001]: type mismatch in match arm: expected Option[Int] but got Unit
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:14:21
  in match arm
  hint: Fix the expression type or change the expected type
   |
14 |             none => break
   |                     ^^^^^

2 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    var low = 0;
    var high = list.len(xs) - 1;
    while low <= high {
        var mid = (low + high) / 2;
        match list.get(xs, mid) {
            some(val) =>
                if val == target then
                    some(mid)
                else if val < target then
                    low = mid + 1
                else
                    high = mid - 1,
            none => break
        }
    };
    none
}
```
