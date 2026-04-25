# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ") |> list.filter((x) => x != "")
  in list.fold(words, map.new(), (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
