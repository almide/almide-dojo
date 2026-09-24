Modify the program below. Return the whole file.

Requested change:

- Add `fn eta(samples: List[Int]) -> (Int) -> String` returning a closure that,
  given the number of remaining work units, answers the estimated remaining
  time formatted by `format_secs`, or `unknown` when there are no samples.

The estimate is `remaining * (total seconds of the samples) / (number of samples)`,
ROUNDED UP to a whole second.

Preserve (the hidden oracle checks these):

- `pad2`, `format_secs` and `spent` keep their exact behaviour.
- Round up only once, at the end: 3 remaining units at an average of 1.5 s
  is 5 s (4.5 rounded up), not 3 or 6. Zero remaining units is `0s`.
- The closure captures only the totals it needs, never `samples`.
