Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A `wd` or `xfer` that would take the balance of the account money leaves
  below zero is invalid. `replay` must fail with
  `line <n>: insufficient funds in <acct> (balance <b>, needed <amount>)`,
  where `<b>` is that account's balance just before the line
  (for example `line 3: insufficient funds in A (balance 50, needed 80)`).
- A withdrawal or transfer that leaves the balance at exactly zero stays valid.

Preserve (the hidden oracle checks these on untouched inputs):

- Every existing error message stays byte-identical (`bad amount <s>`,
  `unknown account <acct>`, `unknown op <op>`, the field-count message, ...),
  and line numbers still count blank lines.
- Within one line the checks keep their order, and the new check comes LAST:
  op and field count, then the amount, then the account(s) involved (for `xfer`
  both the source and the destination), and only then the funds check. So an
  `xfer` to an unknown account reports the unknown account even when the source
  could not cover the amount.
- Across the list the error reported is the one from the FIRST failing line,
  whatever its kind; balances seen by a line reflect every earlier line.
- Errors propagate explicitly (`!`); nothing is clamped or skipped.
