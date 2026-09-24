Modify the program below. Return the whole file.

Requested change:

- Add `fn next_deadline(ds: List[String]) -> (String) -> String` returning a
  closure that, given a project, answers `<project>: due <date>` for the
  EARLIEST valid date (as written), or `<project>: no deadline`.

Preserve (the hidden oracle checks these):

- `parse_date` and `valid_dates` keep their exact behaviour.
- Dates compare by calendar (year, then month, then day), not as text:
  "9/1/2027" is later than "10/12/2026". Invalid dates are ignored.
- The closure captures only the chosen date, never `ds`.
