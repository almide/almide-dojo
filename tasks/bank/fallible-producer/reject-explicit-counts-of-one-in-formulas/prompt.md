Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A count equal to 1 must be left out ("H2O", not "H2O1"). A written count
  whose value is 1 fails with `count 1 must be omitted at <pos>`, `<pos>` the
  position where the count's digits start. This applies to element counts and
  to group counts.

Preserve (the hidden oracle checks these on untouched inputs):

- What counts is the value: `10`, `12`, `16` are fine, while `01` is a count of 1.
- The formula is read left to right and the first problem wins. For a group,
  its inside is read before its own count is checked.
- Existing messages are unchanged; so is the census of valid formulas.
