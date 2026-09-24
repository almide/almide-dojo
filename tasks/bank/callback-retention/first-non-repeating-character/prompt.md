Modify the program below. Return the whole file.

Requested change:

- Add `fn unique_marker(text: String) -> (String) -> String` returning a
  closure that, given a label, answers `<label>: <c>` for the first character
  of `text` that occurs EXACTLY ONCE in it, or `<label>: none`.

Preserve (the hidden oracle checks these):

- `occurrences` and `distinct_chars` keep their exact behaviour.
- "Occurs exactly once" is over the whole text: in "abab c" the answer is
  " " (the space), not "a" (which repeats later). Case-sensitive.
- The closure captures only that character, never `text`.
