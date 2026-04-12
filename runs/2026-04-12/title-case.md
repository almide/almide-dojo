# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2

## Final code

```almide
fn title_case(s: String) -> String = 
  string.join(string.split(s, " ").map((word) => string.capitalize(string.to_lower(word))), " ")
```
