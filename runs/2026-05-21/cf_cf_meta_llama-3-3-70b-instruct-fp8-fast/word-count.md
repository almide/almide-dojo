# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let filtered_words = list.filter(words, (word) => word != "")
  list.fold(filtered_words, map.new(), (freq_map, word) =>
    map.set(freq_map, word, map.get_or(freq_map, word, 0) + 1)
  )
```
