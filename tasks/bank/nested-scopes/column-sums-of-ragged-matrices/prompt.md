Modify the program below. Return the whole file.

Requested change:

- Add `fn column_sums_batch(ms: List[List[List[Int]]]) -> List[String]`
  returning, for each matrix in order, its column sums joined by `,`
  (`""` for a matrix with no cells).

Preserve (the hidden oracle checks these):

- `width`, `cell`, `transpose` and `row_sums` keep their exact behaviour.
- A matrix has as many columns as its LONGEST row; missing cells count 0.
- Each matrix's transpose is a temporary of that matrix's step; the batch
  keeps only the strings.
