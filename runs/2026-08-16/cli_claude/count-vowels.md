# count-vowels

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  string.chars(s)
    |> list.count((c) => list.contains(["a", "e", "i", "o", "u"], c))
```
