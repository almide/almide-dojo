Modify the program below. Return the whole file.

Requested change:

- Add `fn palindrome_count(lines: List[String]) -> (String) -> String`
  returning a closure that, given a label, answers
  `<label>: <n> palindromes`: the number of lines whose `clean` form reads the
  same backwards (a line with nothing left after cleaning does not count).

Preserve (the hidden oracle checks these):

- `clean` and `longest_line` keep their exact behaviour.
- Case, spaces and punctuation are ignored exactly as `clean` ignores them.
- The closure captures only the count, never `lines`.
