Modify the program below. Return the whole file.

Requested change:

- Extract `fn parse_flag(value: String) -> Bool?` and make both `enabled` and
  `is_bool` use it.

Preserve (the hidden oracle checks these):

- `enabled` and `is_bool` stay the same functions of their input: every one
  of the eight spellings, in any case, is a boolean.
- A pure refactor: the helper allocates no more than the inline code did.
