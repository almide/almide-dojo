Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A minute may be produced by only one item of a field. `schedule` (and so
  `count`) must fail with `minute <m> listed twice in <field>`, the field as
  given (for example `minute 5 listed twice in 5,5`).

Preserve (the hidden oracle checks these on untouched inputs):

- What counts is the expanded minutes, not the item texts: `0-10/5,5` repeats
  minute 5, while `1-3,4-6` and `*/15,7` repeat nothing.
- Items are expanded left to right; the reported minute is the first minute that
  an item produces that an EARLIER item already produced. An item error (bad
  item, out of range, empty range, step 0) is reported if its item comes before
  the item that repeats a minute, and loses to it otherwise.
- Existing messages and the expansion order are unchanged.
