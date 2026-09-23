Modify the program below. Return the whole file.

Requested change:

- Extract the date-to-number conversion into `fn day_number(date: String) -> Int?`
  (`none` when a part does not parse) and make `days_between` use it for both
  dates.

Preserve (the hidden oracle checks these):

- `days_between` stays the same function of its input.
- The leap-year rule is unchanged: 1900 and 2100 are NOT leap years, 2000 is.
- `day_number` differences agree with `days_between` for any two dates.
- A pure refactor: the helper allocates nothing the inline code did not.
