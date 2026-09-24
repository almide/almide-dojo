Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A file containing a line whose currency differs from the file's header is no
  longer fatal: `merge` skips the WHOLE file and appends its name to `skipped`.
- `add_line` is unchanged: it still returns `MixedCurrency(file, line)`.

Preserve (the hidden oracle checks these on untouched inputs):

- Nothing from a skipped file ends up in the table, including its lines that came
  before the bad one; a sku priced only by a skipped file does not count as a
  duplicate later.
- Within a file the lines are still checked in order, and the checks of one line
  keep their order: an error that comes BEFORE the mixed-currency line of a file
  is still fatal. `MissingHeader`, `BadPrice` and `DuplicateSku` stay fatal.
- `skipped` lists file names in file order.
