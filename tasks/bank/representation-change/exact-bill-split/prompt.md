Modify the program below. Return the whole file.

Requested change:

- Use exact cents: change `Expense.amount: Float` to `Expense.cents: Int`;
  `expense(what, cents, people)` takes an `Int`; `shares` and `balances` return
  `List[(String, Int)]`. No floating point may remain.
- `shares` splits EXACTLY: the shares add up to the amount, differ by at most one
  cent, and the larger shares (in absolute value) go to the people listed FIRST:
  100 cents among three people is 34, 33, 33.
- `line` prints `name D.CC` (`ann 0.34`, `bo -3.33`, `cy -0.05`).

Preserve (the hidden oracle checks these):

- Refunds split the same way: -100 cents among three is -34, -33, -33, and the shares
  still add up to the amount exactly.
- An amount smaller than the number of people gives some people 0 (`2` cents among
  three is 1, 1, 0).
- `balances` keeps first-seen order of the people and sums their shares exactly.
