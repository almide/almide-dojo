Modify the program below. Return the whole file.

Requested change:

- Add an adapter `type JsonLine: LogFormat = {}` writing one JSON object per hit:
  `{"method":"GET","path":"/a","status":200,"agent":"curl/8"}` — keys in that order,
  no spaces, the status as a bare number, the strings quoted and escaped:
  a backslash becomes `\\`, a double quote `\"`, a newline `\n`, a tab `\t`.
- Add `type Output = | Text(Common) | Json(JsonLine)` and
  `fn dump_as(o: Output, hits: List[Hit], min_status: Int) -> String`.

Preserve (the hidden oracle checks these):

- `Common`, `dump` and the protocol keep their exact behaviour.
- Escaping is exact for every combination: a backslash that precedes a quote in the
  input is written as `\\\"` (escaped backslash, then escaped quote), never with an
  extra backslash; other characters are written unchanged.
- `dump_as` keeps the status filter (inclusive) and the line order.
