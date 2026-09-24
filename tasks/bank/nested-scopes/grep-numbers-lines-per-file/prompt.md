Modify the program below. Return the whole file.

Requested change:

- Add `fn grep(files: List[(String, String)], needle: String) -> List[String]`
  returning `<file>:<line number>:<line>` for every matching line, file by
  file in order, lines in order.

Preserve (the hidden oracle checks these):

- `lines_of`, `matches` and `count_in` keep their exact behaviour.
- Line numbers restart at 1 in EVERY file.
- `needle` is shared outer data; each file's line list is a temporary of that
  file's step.
