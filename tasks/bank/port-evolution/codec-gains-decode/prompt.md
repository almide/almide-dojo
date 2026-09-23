Modify the program below. Return the whole file.

Requested change:

- The `FieldCodec` protocol gains `fn decode(c: Self, s: String) -> String!`, the inverse
  of `encode`, and BOTH adapters implement it.
  - `Caesar.decode` rotates lowercase letters back by `shift`.
  - `Base16.decode` reads pairs of hex digits (upper or lower case). A field of odd
    length fails with `odd length: <field>`; otherwise a field containing anything
    other than `0-9`, `a-f`, `A-F` fails with `bad hex: <field>`.
- Add `fn unpack[C: FieldCodec](c: C, line: String) -> List[String]!` that splits `line`
  on `;` and decodes every field in order.

Preserve (the hidden oracle checks these):

- `encode` and `pack` keep their exact output for both adapters.
- `decode(encode(s)) == s` for every shift >= 0, including letters that wrapped
  around (`a` encoded with shift 3 is `d`, and `x` is `a`) and shifts above 25.
- Base16 decoding is strict: only hex DIGITS are accepted, so `-1`, `+a` or ` a` are
  `bad hex`; the odd-length check comes first.
- `unpack` reports the FIRST bad field in line order, and an empty field decodes to
  the empty string.
