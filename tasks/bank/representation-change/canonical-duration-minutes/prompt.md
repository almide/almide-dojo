Modify the program below. Return the whole file.

Requested change:

- Store durations as minutes: change `Entry.spent: String` to `Entry.spent: Int`.
  `entry(task, h, m)` keeps its signature (m may now be 60 or more; it is simply added).
- Durations are now written in a SHORT canonical form everywhere (`line` and `total`):
  hours and minutes, leaving out a zero part: `1h30m`, `45m`, `2h`, and `0m` for zero.

Preserve (the hidden oracle checks these):

- The short form never shows a zero part except for a zero duration: 120 minutes is
  `2h` (not `2h0m`), 45 minutes is `45m` (not `0h45m`), 0 is `0m`.
- Minutes above 59 carry into hours: `entry("x", 1, 75)` is `2h15m`.
- `over` is strict (a task of exactly `limit_min` minutes is not over) and keeps order.
