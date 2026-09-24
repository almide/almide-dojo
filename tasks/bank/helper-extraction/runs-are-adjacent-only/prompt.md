Modify the program below. Return the whole file.

Requested change:

- Extract the shared run building into `fn runs(xs: List[Int]) -> List[(Int, Int)]`
  (value, length) and make both `encode` and `longest_run` use it.

Preserve (the hidden oracle checks these):

- `encode` and `longest_run` stay the same functions of their input: runs
  are blocks of ADJACENT equal values, so a value that comes back later starts
  a new run.
- A pure refactor: building the runs allocates no more than the inline folds.
