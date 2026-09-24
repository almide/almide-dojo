Modify the program below. Return the whole file.

Requested change:

- Add `fn keyword_count(text: String) -> (String) -> String` returning a
  closure that, given a label, answers `<label>: <n> keywords`: the number of
  words that are not stop words.

Preserve (the hidden oracle checks these):

- `STOP`, `is_stop` and `words` keep their exact behaviour.
- Stop words are recognised in ANY case, exactly as `is_stop` does.
- The closure captures only the count, never `text`.
