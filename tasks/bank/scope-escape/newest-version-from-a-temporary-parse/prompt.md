Modify the program below. Return the whole file.

Requested change:

- Add `fn newest(vs: List[String]) -> String` that returns `newest=<version>`
  for the newest version in `vs`, `none` when `vs` is empty, and
  `error=<message>` when some version does not parse (the message `parse`
  produces, for example `error=bad version: 1.x`).

Preserve (the hidden oracle checks these):

- `parse`, `compare` and `sort_versions` keep their exact behaviour.
- Versions compare numerically with missing components as 0 ("1.10" is newer
  than "1.9"; "2.0" equals "2.0.0").
- When several versions tie for newest, report the one that appears FIRST in
  `vs`, spelled exactly as written.
- When several versions are bad, the error names the first bad one in list order.
- The parsed versions are a temporary of `newest`: return only the string.
