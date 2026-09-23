Modify the program below. Return the whole file.

Requested change:

- Extract the per-line decision into `fn parse_valid(line: String) -> Int?`
  (`some(n)` for a line that counts today, `none` otherwise) and make
  `sum_valid` use it.

Preserve (the hidden oracle checks these):

- `sum_valid` stays the same function of its input, line for line: whatever
  `int.parse` accepts today still counts (it accepts surrounding whitespace and a
  leading `+`), whatever it rejects is still ignored, and a NEGATIVE integer
  line is still ignored.
- The helper is a pure refactor: it introduces no new accepted inputs and drops
  no accepted ones.
