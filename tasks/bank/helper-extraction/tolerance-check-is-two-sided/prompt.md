Modify the program below. Return the whole file.

Requested change:

- Extract `fn within(a: Int, b: Int, tol: Int) -> Bool` and make `passes`,
  `batch_passes` and `rejects` all use it.

Preserve (the hidden oracle checks these):

- The three functions stay the same functions of their input: the tolerance
  applies in BOTH directions (a part that is too small by more than `tol`
  fails too), boundaries included.
- A pure refactor: the helper allocates nothing the inline test did not.
