Modify the program below. Return the whole file.

Requested change:

- Add `fn validity(lines: List[String]) -> (String) -> String` returning a
  closure that, given a file name, answers `<file>: <v>/<n> valid` (n = the
  number of NON-BLANK lines, v = those that are records), followed by
  ` (first bad: <line>)` naming the first non-blank line that is not a record.

Preserve (the hidden oracle checks these):

- `is_blank`, `is_record` and `records` keep their exact behaviour.
- Blank lines (including all-space lines) are neither valid nor invalid: they
  are not counted in `n` and are never "first bad".
- The closure captures only the counts and the first bad line, never `lines`.
