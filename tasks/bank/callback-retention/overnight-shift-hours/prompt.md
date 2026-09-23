Modify the program below. Return the whole file.

Requested change:

- Add `fn timesheet(shifts: List[(String, String)]) -> (String) -> String`: each
  pair is a shift's (start, end) clock time. It returns a closure that, given
  a name, answers `<name> worked <hm(total)>` for the total minutes worked.

Preserve (the hidden oracle checks these):

- `to_minutes`, `hm` and `valid_punches` keep their exact behaviour.
- A shift whose end is earlier than its start crosses midnight
  (22:00 to 06:00 is 8h00m). A shift whose end equals its start lasts 0
  minutes. A shift with a bad clock time is skipped.
- The closure captures only the total, never `shifts`.
