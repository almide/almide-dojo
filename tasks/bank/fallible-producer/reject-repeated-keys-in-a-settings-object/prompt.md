Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A key may appear only once in the same object. Reading a key that the
  enclosing object already has fails with `duplicate key <key> at <pos>`,
  `<pos>` the position where the repeated key starts. This applies to `parse`
  and so to `settings`.

Preserve (the hidden oracle checks these on untouched inputs):

- The same key in different objects is fine: in sibling objects, and in an
  object nested inside another object that has that key.
- A repeated key is a reading error: errors met while reading are reported in
  reading order, left to right, and the repeated key counts as met as soon as
  the key itself has been read (so it wins over any problem later in the
  document, including a later problem in the same field).
- The "too large" check still runs only on a document that reads without
  errors. `settings` output is unchanged.
