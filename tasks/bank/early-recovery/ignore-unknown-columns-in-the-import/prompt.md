Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A header column that is not one of the known columns is no longer fatal:
  `import_csv` ignores that column and adds the warning `ignoring column <col>`,
  once per unknown column, in header order.
- `check_header` is unchanged (it still reports `unknown column <c>`).

Preserve (the hidden oracle checks these on untouched inputs):

- The cells of an ignored column are never read or validated; they may hold
  anything, including nothing.
- Every row must still have as many cells as the header has columns, ignored
  ones included (`row <n>: expected <k> cells`).
- `missing column name` / `missing column age` stay fatal, whether or not there
  are unknown columns; row errors keep their exact text.
