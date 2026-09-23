Modify the program below. Return the whole file.

Requested change:

- Add `fn class_report(students: List[Student]) -> List[String]` returning one
  line per student, in order: `line_for(s)` for a student with scores, and
  `<name>:-` for a student with NO scores.

Preserve (the hidden oracle checks these):

- `average_drop_lowest` and `line_for` keep their exact behaviour (including
  0 for an empty list; only the report shows `-`).
- A student with one score keeps it (nothing is dropped).
- Each student's sorted copy is a temporary of that student's step; the report
  keeps only the lines.
