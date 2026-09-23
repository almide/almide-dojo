Modify the program below. Return the whole file.

Requested change:

- Extract the shared number formatting into `fn money(cents: Int) -> String`
  and make BOTH `receipt_line` and `total_line` use it.

Preserve (the hidden oracle checks these):

- `receipt_line` and `total_line` stay the same functions of their input for
  every amount: positive, zero, negative, below one unit (`-5` cents).
- The TOTAL line still writes a negative amount in parentheses WITHOUT a
  minus sign (`TOTAL (1.50)`); receipt lines still use a leading minus.
- A pure refactor: the helper allocates no more than the inline formatting did.
