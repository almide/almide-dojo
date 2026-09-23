# title-case

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn title_case(s: String) -> String =
  let words = string.split(s, " ")
  let cased = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  string.join(cased, " ")
```
