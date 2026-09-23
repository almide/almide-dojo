# word-count

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let non_empty = list.filter(words, (w) => string.len(w) > 0)
  list.fold(non_empty, map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
```
