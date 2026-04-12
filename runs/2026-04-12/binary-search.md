# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd
error: Expected Then at line 7:43 (got FatArrow '=>')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:7:43
  hint: if requires 'then'. Write: if condition then expr else expr
  |
7 |       case some(value) if value == target => some(mid)
  |                                           ^
error: Expected Then at line 8:42 (got FatArrow '=>')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:8:42
  hint: if requires 'then'. Write: if condition then expr else expr
  |
8 |       case some(value) if value < target => left = mid + 1
  |                                          ^
error: Expected Then at line 9:42 (got FatArrow '=>')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:9:42
  hint: if requires 'then'. Write: if condition then expr else expr
  |
9 |       case some(value) if value > target => right = mid - 1
  |                                          ^
error: Expected expression at line 10:17 (got FatArrow '=>')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:10:17
   |
10 |       case none => break
   |                 ^
error: Expected LBrace at line 12:3 (got RBrace '}')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:12:3
   |
12 |   }
   |   ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:3:30
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  |
3 |   var right = list.len(xs) - 1
  |                              ^

6 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  var left = 0
  var right = list.len(xs) - 1
  while (left <= right) {
    val mid = left + (right - left) / 2
    list.get(xs, mid) match {
      case some(value) if value == target => some(mid)
      case some(value) if value < target => left = mid + 1
      case some(value) if value > target => right = mid - 1
      case none => break
    }
  }
  none
```
