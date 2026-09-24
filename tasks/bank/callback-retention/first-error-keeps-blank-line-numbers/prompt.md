Modify the program below. Return the whole file.

Requested change:

- Add `fn locator(lines: List[String]) -> (String) -> String` returning a
  closure that, given a file name, answers `<file>:<n>: <message>` for the
  FIRST error line (n = its line number), or `<file>: clean` when there is none.

Preserve (the hidden oracle checks these):

- `error_message`, `error_count` and `verdict` keep their exact behaviour.
- Line numbers are the editor's: 1-based, and blank lines count.
- The closure captures only the line number and message, never `lines`.
