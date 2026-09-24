Modify the program below. Return the whole file.

Requested change:

- Add `fn longest_badge(text: String) -> (String) -> String` returning a
  closure that, given a label, answers `<label>: <word> (<length>)` for the
  longest word of `text` (the first one on ties), or `<label>: -` when the
  text has no words.

Preserve (the hidden oracle checks these):

- `is_space`, `words` and `word_count` keep their exact behaviour.
- Words are exactly `words(text)`: a tab or a newline separates words just
  like a space.
- Ties go to the FIRST longest word.
- The closure captures only the word and its length, never `text`.
