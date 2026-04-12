Write two functions with these exact signatures:

    fn rle_encode(s: String) -> String
    fn rle_decode(s: String) -> String

Behavior:

**`rle_encode`**: compress consecutive repeated characters.
- `rle_encode("aaabbc")` returns `"3a2b1c"`
- Each group becomes `<count><char>`
- `rle_encode("")` returns `""`
- Single occurrences still get a `1` prefix: `"abc"` → `"1a1b1c"`

**`rle_decode`**: expand the encoded string back.
- `rle_decode("3a2b1c")` returns `"aaabbc"`
- `rle_decode("")` returns `""`
- Counts are always single-digit (1-9) for simplicity

Notes:

- Use `string.chars(s)` to iterate characters.
- Use `int.to_string(n)` and `int.parse(s)` for number conversions.
- `int.parse` returns `Result[Int, String]`.
