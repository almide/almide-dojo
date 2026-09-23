Modify the program below. Return the whole file.

Requested change:

- Replace the `-1` sentinel with an option: change `Task.due: Int` to `Task.due: Int?`
  (`none` = no deadline) and make `task(title, due)` take `due: Int?`.
- Day numbers may now be negative: a task can be due before the project start
  (`task("prep", some(-3))` is due on day -3).

Preserve (the hidden oracle checks these):

- `render` keeps both formats: `prep (day -3)` and `idea (someday)`.
- `overdue` still lists only tasks with a deadline strictly before `today`, in list
  order; a task due on `today` is not overdue.
- `agenda` still puts the earliest deadline first and tasks WITHOUT a deadline LAST,
  and equal deadlines keep list order.
- `next_due` picks the earliest deadline, the FIRST listed on a tie, and answers
  `none` when no task has one.
- `postpone` moves only real deadlines; `none` stays `none`.
- Every day number is a real deadline now, including `-1` and `0`.
