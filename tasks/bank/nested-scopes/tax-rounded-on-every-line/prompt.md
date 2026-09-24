Modify the program below. Return the whole file.

Requested change:

- Add `fn vat_totals(invoices: List[String]) -> List[Int]` returning, for each
  invoice in order, its total VAT in cents.

Preserve (the hidden oracle checks these):

- `amounts`, `net` and `line_vat` keep their exact behaviour.
- VAT is `line_vat` of EACH line, summed; rounding the total once gives a
  different (illegal here) number.
- Each invoice's amount list is a temporary of that invoice's step.
