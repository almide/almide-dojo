Modify the program below. Return the whole file.

Requested change:

- Add `fn last_words(lines: List[String]) -> (String) -> String` returning a
  closure that, given a fallback, answers the LAST meaningful line (trimmed),
  or the fallback when there is none.

Preserve (the hidden oracle checks these):

- `meaningful`, `line_count` and `first_line` keep their exact behaviour.
- Trailing blank or all-space lines are skipped: the answer is the last line
  with content, trimmed.
- The closure captures only that line, never `lines`.
