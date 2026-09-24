Modify the program below. Return the whole file.

Requested change:

- Add `fn daily_uniques(days: List[String]) -> List[Int]` returning, for each
  day in order, how many DIFFERENT visitors came that day.

Preserve (the hidden oracle checks these):

- `visits`, `total_visits` and `visited_on` keep their exact behaviour.
- Each day counts its own visitors: a visitor who also came on an earlier day
  still counts on this day. Repeat visits within one day count once.
- Each day's visitor set is a temporary of that day's step.
