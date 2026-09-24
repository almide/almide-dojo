Modify the program below. Return the whole file.

Requested change:

- Extract `fn month_index(s: String) -> Int?` (0 for January) and make both
  `month_number` and `quarter` use it.

Preserve (the hidden oracle checks these):

- `month_number` and `quarter` stay the same functions of their input: any
  case, full names or prefixes of at least three letters.
- A pure refactor: the helper allocates no more than the inline lookup did.
