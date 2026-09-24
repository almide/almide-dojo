Modify the program below. Return the whole file.

Requested change:

- Add `fn time_in_meetings(ms: List[String]) -> (String) -> String` returning a
  closure that, given a name, answers `<name>: <minutes> min` — the total
  length of the meetings that person attended.

Preserve (the hidden oracle checks these):

- `parse_meeting` and `meeting_count` keep their exact behaviour.
- A name listed twice in one meeting counts that meeting ONCE. Malformed
  meetings are ignored. Unknown names have 0 minutes.
- The closure captures only one total per person, never `ms`.
