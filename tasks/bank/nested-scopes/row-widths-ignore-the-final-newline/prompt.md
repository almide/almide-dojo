Modify the program below. Return the whole file.

Requested change:

- Add `fn check_files(header: String, files: List[String]) -> List[String]`:
  for each file text in order, `ok` when every row has as many fields as
  `header`, else `row <n>: <w> fields` for the first row that does not
  (n counts from 1).

Preserve (the hidden oracle checks these):

- `fields` and `width` keep their exact behaviour (quoted commas do not split).
- Rows are the lines of the text; the empty piece after the final newline is
  NOT a row. An empty text has no rows (`ok`).
- `header` is shared outer data; each file's rows and fields are temporaries
  of that file's step.
