Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- The units of a duration must come in strictly decreasing size, d then h then
  m then s, each at most once (units may be skipped). A part whose unit is not
  strictly smaller than the unit before it is invalid: `seconds` must fail with
  `unit <u> out of order in <duration>` (for example `unit h out of order in 1h2h`
  or `unit h out of order in 30m1h`).

Preserve (the hidden oracle checks these on untouched inputs):

- Skipped units (`1d1s`), zero amounts (`0h5m0s`) and a single large amount
  (`90m`) stay valid.
- Parts are checked left to right and the first problem wins: a part that is out
  of order is reported before any problem further right (an unknown unit, a
  missing unit), and a problem further left is reported first.
- Every existing error message stays byte-identical; `total` keeps first-error
  semantics in list order.
