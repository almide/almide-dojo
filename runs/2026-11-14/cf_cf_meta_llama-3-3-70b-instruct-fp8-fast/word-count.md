# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.fold(
    list.filter(string.split(s, " "), (w) => w != ""),
    map.new(),
    (m, w) => map.set(m, w, map.get(m, w) ?? 0 + 1)
  )
```
