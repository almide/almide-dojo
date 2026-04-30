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
    let mut count = 1;
    let mut prev_char = s.chars().next().unwrap();

    for c in s.chars().skip(1) {
        if c == prev_char {
            count += 1;
        } else {
            result.push_str(&int.to_string(count));
            result.push(prev_char);
            count = 1;
        }
        prev_char = c;
    }

    if count > 0 {
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
        let count = int.parse(s.substring(i, i + 1)).unwrap();
        i += 1;
        let char = s.substring(i, i + 1).chars().next().unwrap();
        i += 1;
        result.push_str(&char.repeat(count as usize));
    }

    result
}

Note: `substring
```
