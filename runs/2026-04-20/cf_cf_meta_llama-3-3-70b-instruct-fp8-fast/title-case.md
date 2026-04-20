# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn title_case(s: String) -> String =
  let parts = string.split(s, " ")
  let capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  in string.join(capitalized_parts, " ")
```
