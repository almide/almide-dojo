Modify the program below. Return the whole file.

Requested change:

- Add `fn prefix_label(lines: List[String]) -> (String) -> String` returning a
  closure that, given a default, answers the longest prefix shared by EVERY
  line, or the default when that prefix is empty (or there are no lines).

Preserve (the hidden oracle checks these):

- `shared` and `line_count` keep their exact behaviour.
- The prefix is common to ALL lines, whatever their order: comparing only
  the first and the last line is not enough for unsorted lines.
- The closure captures only the prefix, never `lines`.
