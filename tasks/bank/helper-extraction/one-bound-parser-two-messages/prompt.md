Modify the program below. Return the whole file.

Requested change:

- Extract the number parsing of one end into
  `fn parse_bound(text: String, which: String) -> Result[Int, String]`
  (`which` is "start" or "end") and use it for BOTH ends in `parse_range`.

Preserve (the hidden oracle checks these):

- `parse_range` and `range_len` stay the same functions of their input, with
  the same messages: `bad start: <text>` for the start, `bad end: <text>` for
  the end, `missing '..' in ...`, `empty range: ...`.
- The start is checked before the end.
- A pure refactor: the helper allocates nothing the inline parsing did not.
