Modify the program below. Return the whole file.

Requested change:

- Add `fn column_totals(files: List[String], column: String) -> List[String]`
  returning, for each file in order, the total of the named column as a
  string, or `missing` when that file's header has no such column.

Preserve (the hidden oracle checks these):

- `header_of`, `column_index` and `rows_of` keep their exact behaviour.
- Every file is read with ITS OWN header: the column may sit at a different
  position in each file.
- Each file's rows are a temporary of that file's step.
