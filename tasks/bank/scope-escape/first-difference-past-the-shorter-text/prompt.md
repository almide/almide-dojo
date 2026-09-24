Modify the program below. Return the whole file.

Requested change:

- Add `fn first_diff(a: String, b: String) -> String` returning `same`, or
  `line <n>` for the first line number (from 1) where the two texts differ.

Preserve (the hidden oracle checks these):

- `lines_of`, `line_count` and `identical` keep their exact behaviour.
- When one text is a prefix of the other (one has extra lines at the end),
  they differ at the first extra line: "a\nb" vs "a" differ at `line 2`.
  An extra trailing newline is an extra (empty) line.
- The line lists are temporaries of `first_diff`: return only the string.
