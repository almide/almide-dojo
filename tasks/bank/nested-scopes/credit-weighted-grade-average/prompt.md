Modify the program below. Return the whole file.

Requested change:

- Add `fn averages(transcripts: List[String]) -> List[String]` returning, for
  each student in order, the credit-weighted average as a string, or `n/a`
  when the student has no credits.

Preserve (the hidden oracle checks these):

- `parse_course`, `entries`, `credits` and `failed` keep their exact behaviour.
- The average is WEIGHTED: sum(grade * credits) / sum(credits), rounded down;
  a 0-credit course has no weight.
- Each student's entries are a temporary of that student's step.
