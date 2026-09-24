Modify the program below. Return the whole file.

Requested change:

- Replace the day number with a variant:
  `type Day: Eq, Repr = | Mon | Tue | Wed | Thu | Fri | Sat | Sun` and change
  `Meeting.day: Int` to `Meeting.day: Day`. `meeting(title, day, at)` takes a `Day`.
- `day_name`, `is_weekend` and `next_workday` take and return `Day` instead of `Int`;
  `days_until(from, to)` takes two `Day`s. Remove `NAMES` if you no longer need it.

Preserve (the hidden oracle checks these):

- `agenda` runs from Monday to Sunday (the week order, NOT alphabetical order of
  the names), by time within a day, keeping list order for equal slots.
- `next_workday` of Friday, Saturday and Sunday is Monday; of Monday it is Tuesday.
- `days_until` counts forward and wraps: Saturday to Monday is 2, Monday to Sunday
  is 6, a day to itself is 0.
- `weekend_titles` keeps list order.
