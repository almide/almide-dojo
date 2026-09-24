Modify the program below. Return the whole file.

Requested change:

- Add `fn due_dates(days: List[Int], holidays: List[Int]) -> String` returning,
  for each start day, the FIRST open day strictly after it, joined by `,`.

Preserve (the hidden oracle checks these):

- `is_weekend`, `is_open` and `open_days` keep their exact behaviour.
- Keep moving until the day is open: a Friday holiday followed by a weekend
  lands on Monday, and a weekend followed by a Monday holiday lands on
  Tuesday.
- The candidate days are temporaries of `due_dates`: return only the string.
