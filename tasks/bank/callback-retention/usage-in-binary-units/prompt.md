Modify the program below. Return the whole file.

Requested change:

- Add `fn quota_meter(sizes: List[Int]) -> (Int) -> String` returning a closure
  that, given a quota in bytes, answers `<used> of <quota>` (both through
  `human`) followed by ` over` when the total exceeds the quota.

Preserve (the hidden oracle checks these):

- `human` and `largest` keep their exact behaviour: binary units (1024), one
  decimal rounded down.
- Over means strictly more than the quota.
- The closure captures only the total, never `sizes`.
