Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A requirement that no version can satisfy is invalid. `combine` (and so
  `describe`) must fail with `no version satisfies <requirement>`, the
  requirement as given (for example `no version satisfies >=2.0.0 <1.5.0`).

Preserve (the hidden oracle checks these on untouched inputs):

- Versions compare numerically, part by part.
- Equal lower and upper bounds are satisfiable only when BOTH are inclusive
  (`>=1.4.1 <=1.4.1` is exactly 1.4.1).
- The check is on the combined range, after every constraint has been read, so
  a bad constraint or version anywhere is reported first. One-sided and empty
  requirements stay valid; `describe` output is unchanged.
