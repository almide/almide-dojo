Modify the program below. Return the whole file.

Requested change:

- Store the next due date itself: change `Sub` to
  `type Sub: Eq, Repr = { name: String, next: Date, day: Int }` where `next` is the next
  unpaid due date and `day` the billing day of the month taken from the start date.
  `sub(name, start)` keeps its signature. `due(s)` returns `s.next`; `pay(s)` moves
  `next` one month forward.

Preserve (the hidden oracle checks these):

- Every due date falls on the billing day, or on the last day of a shorter month,
  and a short month does not change the billing day for later months: a subscription
  started on 2024-01-31 is due 2024-01-31, 2024-02-29, 2024-03-31, 2024-04-30.
- Leap years follow the Gregorian rule (2100 is not a leap year, 2000 is).
- `schedule` and `render` keep their output; months roll over into the next year.
