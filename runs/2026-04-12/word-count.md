# word-count

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn word_count(s: String) -> Map[String, Int] =
  list.fold(
    list.filter(string.split(s, " "), (w) => string.len(w) > 0),
    map.new(),
    (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1)
  )
```
