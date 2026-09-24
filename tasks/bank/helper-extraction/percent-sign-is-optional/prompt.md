Modify the program below. Return the whole file.

Requested change:

- Extract `fn pct(typed: String) -> Int?` (the percentage when valid, else
  `none`) and make both `apply_discount` and `valid_pct` use it.

Preserve (the hidden oracle checks these):

- `apply_discount` and `valid_pct` stay the same functions of their input:
  the "%" sign is OPTIONAL ("15" and "15 %" are both valid), values 0-100.
- A pure refactor: the helper allocates no more than the inline code did.
