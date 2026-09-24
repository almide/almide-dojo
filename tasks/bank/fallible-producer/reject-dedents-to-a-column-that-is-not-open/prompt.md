Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A shallower item must line up with an item that is still open. When an item
  closes one or more sub-lists and its column is not the column of an open
  level, `outline` fails with
  `line <n>: column <c> does not match an open level`.

Preserve (the hidden oracle checks these on untouched inputs):

- "Open" means the levels on the way from the top to the item just before:
  a column used somewhere else in the file, by a sub-list that is already
  closed, does not count.
- Going deeper is still allowed by any amount, and staying at the same column
  continues the list.
- Lines are handled in order and the first problem wins; the existing tab and
  first-item errors keep their text.
- The numbering of valid outlines is unchanged.
