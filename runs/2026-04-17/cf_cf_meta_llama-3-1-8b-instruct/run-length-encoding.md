# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
### rle_encode
fn rle_encode(s: String) -> String {
    let mut result = String::new();
    let mut count = 0;
    let mut prev_char = None;

    for c in s.chars() {
        if Some(c) == prev_char {
            count += 1;
        } else {
            if let Some(prev_char) = prev_char {
                result.push_str(&int.to_string(count));
                result.push(prev_char);
            }
            count = 1;
        }
        prev_char = Some(c);
    }

    if let Some(prev_char) = prev_char {
        result.push_str(&int.to_string(count));
        result.push(prev_char);
    }

    result
}

### rle_decode
fn rle_decode(s: String) -> String {
    let mut result = String::new();
    let mut i = 0;

    while i < s.len() {
        let count = int.parse(s.get(i..i + 1).unwrap()).unwrap();
        let char = s.get(i + 1..i + 2).unwrap().chars().next().unwrap();
        result.push_str(&char.repeat(count));
        i += 2;
    }
```
