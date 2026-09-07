Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A line whose `qty` is negative is invalid. `parse_line` must return
  `err("negative qty: <sku>")` for it (for example `negative qty: A1`).
- A `qty` of zero stays valid.

Preserve (the hidden oracle checks these on untouched inputs):

- Every existing error message stays byte-identical, including `bad field count: <raw>`.
- `parse_all` keeps first-error semantics: the error reported is the one from the
  FIRST invalid line in list order, whatever kind of error it is.
- Errors propagate explicitly (`!`). Do not swallow an error into a default value.
