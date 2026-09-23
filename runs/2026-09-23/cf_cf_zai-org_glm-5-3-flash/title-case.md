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
  let parts = string.split(s, " ")
  let titled = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  string.join(titled, " ")
```
