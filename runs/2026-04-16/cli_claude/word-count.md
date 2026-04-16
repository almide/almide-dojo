# word-count

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = list.filter(string.split(s, " "), (w) => w != "")
  list.fold(words, map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
```
