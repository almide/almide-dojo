Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A missing operand is no longer read as 0: an instruction that needs more
  values than the stack holds fails with
  `stack underflow at <k>: <op> needs <n>, has <m>`
  (for example `stack underflow at 1: add needs 2, has 0`).
  `add`, `sub`, `mul` and `swap` need 2 values; `dup`, `drop` and `out` need 1;
  `push` needs none.

Preserve (the hidden oracle checks these on untouched inputs):

- Instruction numbers are the existing ones (from 1, comments and blank lines
  not counted).
- A stack holding exactly the needed number of values is fine, and a program
  may end with an empty stack.
- Every existing error message stays byte-identical (`unknown op <op> at <k>`,
  `push needs a value at <k>`, `bad value at <k>`), and the first failing
  instruction wins.
- Results are unchanged for programs that never underflow.
