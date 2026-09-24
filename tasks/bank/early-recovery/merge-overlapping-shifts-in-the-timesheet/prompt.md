Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An `Overlap` is no longer fatal: `load` merges the new shift with the
  worker's shifts it overlaps into ONE shift, from the earliest start to the
  latest stop, and adds the note `merged <worker> into <HH:MM>-<HH:MM>` (the
  merged span).
- `add_shift` is unchanged: it still returns `Overlap(worker, existing, new)`.

Preserve (the hidden oracle checks these on untouched inputs):

- The merge takes in every shift of that worker that overlaps the growing
  merged span, so a new shift that bridges two existing shifts turns all three
  into one. Shifts that only touch are not merged; other workers are untouched.
- `BadLine` and `BadTime` stay fatal, before or after a merge.
- Notes are in line order, one per merge; `report` output is otherwise unchanged.
