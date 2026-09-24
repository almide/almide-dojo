Modify the program below. Return the whole file.

Requested change:

- Add `fn outline_stats(text: String) -> String` returning
  `items=<n>,leaves=<l>`: `n` entries, of which `l` are leaves (entries with
  no children).

Preserve (the hidden oracle checks these):

- `level`, `entries` and `deepest` keep their exact behaviour.
- An entry is a leaf when the NEXT entry is not deeper than it — a following
  sibling at the SAME level still makes it a leaf; the LAST entry is always a
  leaf. Blank lines are not entries. No entries:
  `items=0,leaves=0`.
- The entry list is a temporary of `outline_stats`: return only the string.
