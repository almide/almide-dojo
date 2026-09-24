Modify the program below. Return the whole file.

Requested change:

- Add `fn total(ss: List[String]) -> String` returning the sum as
  `<h>h<mm>m` (minutes always two digits, e.g. `2h05m`), or the `parse_all`
  error.

Preserve (the hidden oracle checks these):

- `parse_duration`, `parse_all` and `count_long` keep their exact behaviour.
- Minutes carry into hours: the minutes part of the result is always 0-59
  ("45m" + "30m" is `1h15m`, "90m" alone is `1h30m`).
- The parsed list is a temporary of `total`: return only the string.
