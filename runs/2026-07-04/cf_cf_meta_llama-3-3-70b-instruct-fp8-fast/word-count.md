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
  let non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  in list.fold(non_empty_words, map.new(), (acc, word) => 
    map.set(acc, word, map.get_or(acc, word, 0) + 1))
```
