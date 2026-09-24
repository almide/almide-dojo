Modify the program below. Return the whole file.

Requested change:

- Add `fn best_attempts(courses: List[Course]) -> List[String]` returning one
  line per course, in order: `<title>: <student>=<best>, ...` over the
  course's `students` (alphabetical), where `<best>` is the student's highest
  non-void score, or `none` when all their attempts were void.

Preserve (the hidden oracle checks these):

- `is_void`, `sat` and `students` keep their exact behaviour.
- A void attempt (-1) is never a score: a student with only void attempts
  shows `none`, not `-1`. A real score of 0 is a score.
- Each course's best-score table is a temporary of that course's step.
