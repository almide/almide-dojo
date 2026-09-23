Modify the program below. Return the whole file.

Requested change:

- The ledger now records cents. Introduce `type Money: Eq, Repr = { cents: Int }` and
  change `Entry.amount: Int` to `Entry.amount: Money`.
- `entry(desc, cents)` keeps its name and arity; its second argument is now cents.
- `money` takes a `Money` and prints dollars with exactly two cent digits:
  `1205` cents is `$12.05`, `-1250` is `-$12.50`, `0` is `$0.00`.
- `balance` returns a `Money`.

Preserve (the hidden oracle checks these):

- Every sign renders correctly: an amount between -1 and -99 cents keeps its minus
  (`-5` cents is `-$0.05`), and the cents are always two digits (`$3.07`, not `$3.7`).
  Integer `/` and `%` truncate toward zero in Almide.
- `statement` keeps its line format (`<desc> <amount> = <running balance>`), with the
  running balance rendered by the same rule.
- `biggest_expense` still picks the most negative amount, the FIRST one on a tie, and
  answers `none` when nothing is negative; a one-cent expense is an expense, a zero
  amount is not.
- `large(es, limit)` keeps its signature and its `limit` is still in WHOLE DOLLARS:
  with `limit = 100`, an entry of `-10000` cents is large and one of `9999` cents is not.
