# word-count

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ") |> list.filter((w) => !string.is_empty(w))
  list.fold(words, map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-0.almd
error: '!' is not valid in Almide at line 2:58
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-0.almd:2:58
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   let words = string.split(s, " ") |> list.filter((w) => !string.is_empty(w))
  |                                                          ^
error[E003]: undefined variable 'words'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
  |             ^^^^^

2 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ") |> list.filter((w) => not string.is_empty(w))
  list.fold(words, map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
```
