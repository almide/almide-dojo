Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A label may have at most 63 characters: longer fails with
  `label too long (<len>) in <host>`.
- A hostname may have at most 253 characters, not counting the one optional
  trailing dot: longer fails with `hostname too long (<len>) in <host>`,
  `<len>` measured without that trailing dot.

Preserve (the hidden oracle checks these on untouched inputs):

- Exactly 63 (label) and exactly 253 (hostname, with or without its trailing
  dot) are valid.
- Labels are checked left to right, and for each label the new length check
  runs after the existing checks of that label. So the first bad label wins,
  whatever its problem. The total length is checked only after every label has
  passed.
- Existing messages, normalization and the list's first-error semantics are
  unchanged.
