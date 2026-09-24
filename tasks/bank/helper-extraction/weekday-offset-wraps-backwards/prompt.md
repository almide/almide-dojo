Modify the program below. Return the whole file.

Requested change:

- Extract `fn shift(day: Int, offset: Int) -> Int` (the resulting weekday
  number) and make both `day_name` and `is_weekend` use it.

Preserve (the hidden oracle checks these):

- `day_name` and `is_weekend` stay the same functions of their input for any
  offset, negative ones included (Monday - 1 day is Sunday).
- `shift` always returns 0-6.
- A pure refactor: the helper allocates nothing the inline arithmetic did not.
