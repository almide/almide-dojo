Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A closing bracket must match the most recently opened bracket that is still
  open. Otherwise `scan` (and so `deepest`) fails with
  `expected <closer> but found <c> at <pos>`, `<closer>` being the closer the
  open bracket needs (for example `expected ] but found ) at 2` for `([)]`).

Preserve (the hidden oracle checks these on untouched inputs):

- Pairing is by nesting, not by counts: `([)]` is wrong although each kind is
  balanced.
- Brackets inside string literals are ignored, including after an escaped
  quote `\"`.
- A closer with nothing open is still `unmatched <c> at <pos>`; the characters
  are scanned left to right and the first problem wins; the end-of-input
  messages are unchanged.
