# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd
error[E003]: undefined variable 'map'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd:4:5
  in variable map
  hint: Check the variable name
  |
4 |     map.empty,
  |     ^^^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.fold(
    list.filter(string.split(s, " "), (x) => x != ""), 
    map.empty, 
    (acc, word) => map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
