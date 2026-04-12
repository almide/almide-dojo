Write two functions with these exact signatures:

    fn encrypt(text: String, shift: Int) -> String
    fn decrypt(text: String, shift: Int) -> String

Behavior:

- `encrypt` shifts each lowercase letter (`a`-`z`) forward by `shift` positions, wrapping around
- `decrypt` reverses the encryption (shifts backward by `shift`)
- Non-lowercase characters are left unchanged
- `shift` can be any non-negative integer (including values >= 26)
- `encrypt("abc", 1)` must return `"bcd"`
- `decrypt("bcd", 1)` must return `"abc"`

Notes:

- Use `string.chars(s)` to get individual characters.
- Use `string.codepoint(c)` to get the Unicode codepoint of a character.
- Use `string.from_codepoint(n)` to convert back.
- The codepoint for `'a'` is `97`, `'z'` is `122`.
