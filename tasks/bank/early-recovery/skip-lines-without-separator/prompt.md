Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A line with no `=` is no longer fatal: `load` skips it and counts it in
  `skipped`. `parse_entry` itself keeps returning `err("missing separator: <line>")`.

Preserve (the hidden oracle checks these on untouched inputs):

- Every OTHER error still propagates with its exact message: `empty key: <line>`
  and `duplicate key: <key>`.
- Recovery is by error KIND, not by position: a missing separator anywhere in
  the list is skipped, an empty key anywhere in the list is fatal.
- A value may itself contain `=` (`a=b=c` maps `a` to `b=c`).
