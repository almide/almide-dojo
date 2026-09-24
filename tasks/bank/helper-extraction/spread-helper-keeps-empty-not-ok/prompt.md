Modify the program below. Return the whole file.

Requested change:

- Extract `fn spread(xs: List[Int]) -> Int` (max minus min; 0 for no readings)
  and make both `within` and `summary` use it.

Preserve (the hidden oracle checks these):

- `within` and `summary` stay the same functions of their input. In
  particular no readings is still NOT within tolerance (for any tolerance)
  and the summary still says `no data`.
- A pure refactor: the helper allocates nothing the inline min/max did not.
