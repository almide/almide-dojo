Modify the program below. Return the whole file.

Requested change:

- Add `fn attendance(regs: List[String]) -> List[String]` returning, for each
  student in order, the percentage present among the days that count,
  rounded down (`"80%"`), or `n/a` when no day counts.

Preserve (the hidden oracle checks these):

- `marks`, `absences` and `perfect` keep their exact behaviour.
- Excused days are left OUT of the percentage entirely: "PPE" is 100%, not 66%.
- Each register's marks are a temporary of that student's step.
