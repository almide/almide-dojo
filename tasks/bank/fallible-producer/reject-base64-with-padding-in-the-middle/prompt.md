Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- `=` may only pad the END of the input, and there may be at most two of
  them. `decode` must fail with `bad padding at <pos>`, `<pos>` the 0-based
  position of the first `=` that breaks the rule (for example `QQ==QUI=` fails
  at 2, `Q===` at 1).

Preserve (the hidden oracle checks these on untouched inputs):

- One or two trailing `=`, no padding at all, and empty input stay valid.
- A `=` is misplaced when anything other than `=` follows it, or when it would be
  the third-from-last or earlier `=` of the padding.
- The length check comes first. Then characters are checked left to right, and
  the first problem wins, whether it is a bad character or bad padding.
- Decoded bytes are unchanged.
