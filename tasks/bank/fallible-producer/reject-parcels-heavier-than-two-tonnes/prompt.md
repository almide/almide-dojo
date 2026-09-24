Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A parcel may weigh at most two tonnes (`LIMIT_MG`). `parse_parcel` must fail
  with `too heavy: <parcel> (<weight in mg> mg)` for a heavier one
  (for example `too heavy: crate (2000000001 mg)`).

Preserve (the hidden oracle checks these on untouched inputs):

- The limit is on the weight after unit conversion, whatever unit the line uses;
  exactly two tonnes is allowed in every unit.
- Every existing error message stays byte-identical, and those checks
  (`bad line`, `missing amount`, `bad amount`, `unknown unit`, `empty parcel`) run
  before the new one.
- `manifest` keeps first-error semantics in line order and its output format.
