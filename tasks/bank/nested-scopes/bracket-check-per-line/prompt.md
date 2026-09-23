Modify the program below. Return the whole file.

Requested change:

- Add `fn check_lines(lines: List[String]) -> List[String]` returning one entry
  per line, in order: `ok` for a balanced line, `bad@<i>` for a line with a
  wrong closer at position `i`, and `open@<i>` for a line that ends with
  brackets still open.

Positions are 0-based character positions within that line.

Preserve (the hidden oracle checks these):

- `scan`, `balanced` and the helpers keep their exact behaviour.
- For `open@<i>`, `i` is the position of the EARLIEST opener still unclosed at
  the end of the line (for "(a[b" that is 0, not 2).
- Each line's stack is a temporary of that line's step; lines never share
  state.
