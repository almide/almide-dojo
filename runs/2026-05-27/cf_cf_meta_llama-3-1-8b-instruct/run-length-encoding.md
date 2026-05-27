# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
## Run-Length Encoding (RLE) Functions

### `rle_encode`

fn rle_encode(s: String) -> String {
    let mut prev_char = None
    let mut count = 0
    let mut result = ""

    for char in string.chars(s) {
        if char == prev_char {
            count += 1
        } else {
            if let Some(prev_char) = prev_char {
                result += int.to_string(count) + prev_char
            }
            prev_char = Some(char)
            count = 1
        }
    }

    if let Some(prev_char) = prev_char {
        result += int.to_string(count) + prev_char
    }

    result
}

### `rle_decode`

fn rle_decode(s: String) -> String {
    let mut result = ""
    let mut i = 0

    while i < string.len(s) {
        let count = int.parse(s.slice(i, i + 1)).unwrap_or(0)
        let char = s.slice(i + 1, i + 2)
        result += string.repeat(char, count)
        i += 2
    }

    result
}

These
```
