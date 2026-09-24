Modify the program below. Return the whole file.

Requested change:

- Extract `fn mask(card: String) -> String` (the masked number) and make
  `receipt_line` use it.

Preserve (the hidden oracle checks these):

- `receipt_line` and `last4` stay the same functions of their input: the
  spaces stay exactly where they were typed; only the last four DIGITS are
  shown.
- A pure refactor: the helper allocates no more than the inline code did.
