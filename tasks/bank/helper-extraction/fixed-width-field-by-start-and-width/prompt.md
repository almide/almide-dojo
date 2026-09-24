Modify the program below. Return the whole file.

Requested change:

- Extract `fn field(line: String, start: Int, width: Int) -> String` (the
  trimmed text of `width` columns beginning at column `start`) and use it for
  all three fields of `parse_record`.

Preserve (the hidden oracle checks these):

- `parse_record` and `total_qty` stay the same functions of their input: the
  columns are exactly 0-3, 4-7 and 8-19.
- `field(line, start, width)` covers columns `start` to `start + width - 1`.
- A pure refactor: the helper allocates nothing the inline slicing did not.
