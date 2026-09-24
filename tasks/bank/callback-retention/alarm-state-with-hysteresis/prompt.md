Modify the program below. Return the whole file.

Requested change:

- Add `fn alarm_panel(readings: List[Int]) -> (String) -> String` returning a
  closure that, given a sensor name, answers `<name>: ALARM` when the alarm is
  on after the last reading, else `<name>: ok`.

Preserve (the hidden oracle checks these):

- `ON_AT`, `OFF_AT`, `step` and `peak` keep their exact behaviour.
- The state follows `step` over EVERY reading in order: after 85 then 75 the
  alarm is still ON (75 is not low enough to switch it off).
- The closure captures only the final state, never `readings`.
