# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-word-count-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.fold(list.filter(string.split(s, " "), (w: String) => w != ""), Map.empty, (acc, w) => 
    map.set(acc, w, map.get_or(acc, w, 0) + 1)
  )
```
