Modify the program below. Return the whole file.

Requested change:

- Add `fn statement(ms: List[Int]) -> (String) -> String` returning a closure
  that, given an account name, answers `<name>: balance <b>, fees <f>` after
  applying every movement in order with `apply_fee`.

Preserve (the hidden oracle checks these):

- `apply_fee`, `deposits` and `withdrawals` keep their exact behaviour.
- A fee is charged only when the balance CROSSES below zero; further
  withdrawals while negative do not add fees; after coming back to zero or
  above, a new crossing charges again. The fee itself is part of the balance.
- The closure captures only the balance and fee total, never `ms`.
