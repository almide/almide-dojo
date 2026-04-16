# title-case

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn title_case(s: String) -> String = string.join(list.map(string.split(s, " "), (w) => string.capitalize(string.to_lower(w))), " ")
```
