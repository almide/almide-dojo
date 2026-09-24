Modify the program below. Return the whole file.

Requested change:

- Extract `fn is_leap(y: Int) -> Bool` and make `days_in_year` and `february`
  use it.

Preserve (the hidden oracle checks these):

- `days_in_year`, `february` and `days_between_years` stay the same functions
  of their input, including the century rule (1900 and 2100 are not leap,
  2000 and 2400 are).
- A pure refactor: the helper allocates nothing the inline test did not.
