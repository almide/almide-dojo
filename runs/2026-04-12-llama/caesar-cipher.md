# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2

## Final code

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let shifted_chars = chars.map((c) => {
        let codepoint = string.codepoint(c);
        match codepoint {
            Some(cp) => if cp >= 97 and cp <= 122 then
                string.from_codepoint(((cp - 97 + shift) % 26) + 97)
            else c,
            None => c
        }
    });
    string.join(shifted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let shifted_chars = chars.map((c) => {
        let codepoint = string.codepoint(c);
        match codepoint {
            Some(cp) => if cp >= 97 and cp <= 122 then
                string.from_codepoint(((cp - 97 - shift + 26) % 26) + 97)
            else c,
            None => c
        }
    });
    string.join(shifted_chars, "")
}
```
