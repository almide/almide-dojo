# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") 
  list.fold(words, map.new(), (m, w) => 
    match string.trim(w) {
      "" => m,
      _ => map.set(m, w, map.get(m, w) ?? 0 + 1)
    }
  )
```
