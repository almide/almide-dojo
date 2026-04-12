# title-case

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn title_case(s: String) -> String =
  string.join(list.map(string.split(s, " "), (word) => string.capitalize(string.to_lower(word))), " ")
```
