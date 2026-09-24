Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A malformed row is no longer fatal: `check` skips it and adds the warning
  `line <n>: skipped malformed row`.
- The skipped row's amount is unknown, so the first well-formed row after it is
  not checked against the running balance: its stated balance is taken as the
  new running balance.
- `parse_row` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Only that one row is trusted, however many malformed rows come before it;
  the rows after it are checked against the running balance again.
- The trusted row is otherwise an ordinary row: its date must not be earlier
  than the last well-formed row's date (`OutOfOrder`), and it gets the
  zero-amount warning if its amount is 0. Skipped rows do not count in `rows`.
- `Mismatch` and `OutOfOrder` stay fatal with their payloads. Warnings come in
  line order.
