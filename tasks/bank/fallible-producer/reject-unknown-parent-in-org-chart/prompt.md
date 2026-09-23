Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A node whose parent id is not the id of any node in the input (and is not
  `-`) is invalid. `build` and `headcount` must fail with
  `unknown parent <parent> for <id>` (for example `unknown parent zz for b`).

Preserve (the hidden oracle checks these on untouched inputs):

- A parent may be declared LATER in the list than its child; that stays valid.
- Every existing error message stays byte-identical (`bad line: <line>`,
  `duplicate id <id>`, `multiple roots: <a> and <b>`, `no root`).
- Order of errors: the existing single pass over the lines runs first, in
  list order, and reports its errors (bad line, duplicate id, multiple roots),
  then `no root`; only after that are parents checked, over the nodes in list
  order, and the first unknown parent is reported. So a duplicate id on a later
  line wins over an unknown parent on an earlier line.
- Errors propagate explicitly (`!`).
