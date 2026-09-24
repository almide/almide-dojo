Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A line that ends inside a quoted field is no longer an error: the record
  continues on the next line (the field then contains a newline, `\n`, where the
  line break was), and so on until the quote closes.
- If the input ends while the quote is still open, it is `OpenQuote(n)` with
  `n` the line where that record started.
- `parse_record` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Line numbers stay physical line numbers: an error in a record that spans
  lines names the record's FIRST line, and records after it name their own
  physical line (not their record count).
- `BadQuote` and `FieldCount` stay fatal; quoting rules (`""` inside quotes) are
  unchanged.
