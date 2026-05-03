# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] = 
    let words = string.split(s, " ") |> list.filter((x) => not(string.is_empty(x)))
    let init_map = map.new[String, Int]()
    in list.fold(words, init_map, (acc, x) => 
        map.set(acc, x, map.get_or(acc, x, 0) + 1))
```
