Modify the program below. Return the whole file.

Requested change:

- Store the time as hours and minutes: introduce
  `type Clock: Eq, Repr = { h: Int, m: Int }` (always `0 <= h < 24`, `0 <= m < 60`)
  and change `Alarm.at: Int` to `Alarm.at: Clock`.
- `alarm(label, h, m)` replaces `alarm(label, at)`.
- `next_after(alarms, now)` now takes `now: Clock`.

Preserve (the hidden oracle checks these):

- `shift` still moves by any number of minutes, in either direction, wrapping
  around midnight, and always produces a valid `Clock`: `00:10` shifted by `-20`
  is `23:50`, by `-1460` is `23:50` too, and `23:59` shifted by `1` is `00:00`.
- `render` keeps `HH:MM label` with two digits each.
- `next_after` includes an alarm exactly at `now`, wraps to tomorrow's earliest
  alarm when nothing is left today, prefers the first listed on equal times, and
  answers `none` for an empty list.
- `schedule` orders by time of day (09:05 before 10:00 before 10:30) and keeps list
  order for equal times.
