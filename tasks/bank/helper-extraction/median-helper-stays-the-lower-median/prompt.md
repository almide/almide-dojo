Modify the program below. Return the whole file.

Requested change:

- Extract `fn median(xs: List[Int]) -> Int?` and make both `report` and
  `above_median` use it.

Preserve (the hidden oracle checks these):

- `report` and `above_median` stay the same functions of their input: the
  median is the LOWER median for an even count (of [1, 2, 3, 4] it is 2).
- A pure refactor: the helper allocates no more than the inline code did.
