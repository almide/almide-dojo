Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Inside a transaction, a statement that fails with `NoKey` or `NotANumber` is
  no longer fatal: the transaction is rolled back. The store goes back to what
  it was at its BEGIN, the rest of the transaction up to its COMMIT is not
  run, and `run` adds the note
  `line <n>: rolled back transaction from line <begin>`.
- `exec` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Nothing from a rolled-back transaction takes effect: not the statements
  before the failing one, and not the ones after it.
- The statements after the failing one are still read: a `Syntax` error or a
  misplaced BEGIN there is fatal as before, and a transaction with no COMMIT is
  still `Unclosed(<begin>)`.
- Outside a transaction, `NoKey` and `NotANumber` stay fatal. Notes come in line
  order.
