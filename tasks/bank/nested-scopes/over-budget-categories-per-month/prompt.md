Modify the program below. Return the whole file.

Requested change:

- Add `fn budget_report(limits: Map[String, Int], months: List[Month]) -> List[String]`
  returning one line per month, in order: `<name>: <c1>,<c2>` listing the
  categories whose month total is OVER their limit (in order of first expense),
  or `<name>: ok` when none is.

Preserve (the hidden oracle checks these):

- `totals` and `spent` keep their exact behaviour.
- Over means strictly greater than the limit (a total equal to the limit is ok).
- A category with NO entry in `limits` is unlimited: it is never over.
- `limits` is shared outer data read by every month; each month's category
  totals are a temporary of that month's step.
