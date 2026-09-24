Modify the program below. Return the whole file.

Requested change:

- Add `fn wrap_stats(text: String, width: Int) -> String` that wraps the text
  greedily (each line takes as many following words as fit) and returns
  `lines=<n>,longest=<m>` (m = the longest line's length).

Preserve (the hidden oracle checks these):

- `words`, `joined_length` and `fits_one_line` keep their exact behaviour.
- A line's length counts the single spaces between its words: "ab cd" is 5,
  so it fits width 5 but not width 4.
- A word longer than `width` is put on a line of its own, unbroken.
- No words: `lines=0,longest=0`.
- The line list is a temporary of `wrap_stats`: return only the string.
