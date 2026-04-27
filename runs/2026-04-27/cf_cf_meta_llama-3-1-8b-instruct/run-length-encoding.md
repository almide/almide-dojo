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
    let mut prev_char = '\0';

    for c in string.chars(s) {
        if c == prev_char {
            count += 1;
        } else {
            if prev_char != '\0' {
                result += int.to_string(count);
                result += string.from_char(prev_char);
            }
            count = 1;
        }
        prev_char = c;
    }

    if prev_char != '\0' {
        result += int.to_string(count);
        result += string.from_char(prev_char);
    }

    result
}

### rle_decode

fn rle_decode(s: String) -> String {
    let mut result = String::new();
    let mut count = 0;
    let mut i = 0;

    while i < string.len(s) {
        let c = string.get(s, i).unwrap();
        if c.is_digit(10) {
            count = int.parse(s.substring(i, i + string.len(c))).unwrap();
            i += string.len(c);
        } else {
            result += string.repeat
```
