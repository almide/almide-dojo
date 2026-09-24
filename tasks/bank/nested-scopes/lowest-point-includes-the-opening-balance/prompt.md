Modify the program below. Return the whole file.

Requested change:

- Add `fn lowest_points(stmts: List[String]) -> List[Int]` returning, for each
  statement in order, the LOWEST balance the account ever had.

Preserve (the hidden oracle checks these):

- `movements`, `closing` and `running` keep their exact behaviour.
- The opening balance 0 is one of the balances: an account that only ever
  receives money has a lowest point of 0, and an empty statement has 0.
- Each statement's running balances are a temporary of that statement's step.
