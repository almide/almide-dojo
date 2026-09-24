Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- The shares of a plan must add up to exactly 100%. Otherwise `allocate` must
  fail with `shares add up to <sum>%, not 100%`, the sum written with one
  decimal (for example `shares add up to 90.0%, not 100%`).

Preserve (the hidden oracle checks these on untouched inputs):

- "Exactly" is exact in decimal: shares are written with at most one decimal,
  and `33.4 + 33.3 + 33.3` is exactly 100.
- Every line is parsed and checked first (`bad line`, `bad percent <raw> for <team>`,
  `duplicate team <team>`, first failing line wins); the sum is checked after that.
- Allocations of a valid plan are unchanged.
