**`rle_encode`**: compress consecutive repeated characters.
- `rle_encode("aaabbc")` returns `"3a2b1c"`
- Each group becomes `<count><char>`
- `rle_encode("")` returns `""`
- Single occurrences still get a `1` prefix: `"abc"` → `"1a1b1c"`

**`rle_decode`**: expand the encoded string back.
- `rle_decode("3a2b1c")` returns `"aaabbc"`
- `rle_decode("")` returns `""`
- Counts are always single-digit (1-9) for simplicity
