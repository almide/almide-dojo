Modify the program below. Return the whole file.

Requested change:

- Add `fn cover_check(entries: List[String]) -> Result[(Int) -> String, String]`.
  It sums the ledger (the first bad entry is the error `cents` reports) and
  returns a closure that, given a withdrawal in cents, answers
  `ok, <balance after> left` when the balance covers it and
  `short by <missing>` otherwise, amounts written with `show`.

Preserve (the hidden oracle checks these):

- `cents` and `show` keep their exact behaviour: "0.5" is 50 cents and "7.05"
  is 705.
- Covered means balance >= withdrawal (withdrawing everything is ok).
- The closure captures only the balance, never `entries`.
