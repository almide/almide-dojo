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
    let mut current_char = '\0';

    for c in s.chars() {
        if c == current_char {
            count += 1;
        } else {
            if current_char != '\0' {
                result.push_str(&int.to_string(count));
                result.push(current_char);
            }
            current_char = c;
            count = 1;
        }
    }

    if current_char != '\0' {
        result.push_str(&int.to_string(count));
        result.push(current_char);
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

    result
}
```
