Modify the program below. Return the whole file.

Requested change:

- Add `fn reporters(sales: List[Sale]) -> List[(String, (Int) -> String)]`:
  one `(region, closure)` pair per region, in order of first appearance. Given
  a target, the closure answers `<region>: <total>/<target> met` when the
  region's total is at least the target, else `<region>: <total>/<target> short`.

Preserve (the hidden oracle checks these):

- `same_region`, `regions` and `region_total` keep their exact behaviour.
- Regions are case-insensitive exactly as `regions` groups them: one pair per
  region, named with the spelling of its first sale, totalling every sale of
  that region whatever its case.
- Each closure captures only its region's name and total, never `sales`.
