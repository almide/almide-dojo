Modify the program below. Return the whole file.

Requested change:

- Add `fn peak(lines: List[String]) -> String` returning `peak=<n>`, the
  largest number of meetings in progress at the same moment, or the parse
  error message when a line is bad (the first bad line, as `parse_meeting`
  reports it).

Preserve (the hidden oracle checks these):

- `minutes`, `parse_meeting`, `parse_meetings` and `booked_minutes` keep their exact behaviour.
- Spans are half-open: back-to-back meetings (one ends at 10:00, the next
  starts at 10:00) are never in progress together. A meeting whose end is not
  after its start is never in progress. No meetings: `peak=0`.
- The event list is a temporary of `peak`: return only the string.
