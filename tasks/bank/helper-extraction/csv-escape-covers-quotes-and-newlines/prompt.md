Modify the program below. Return the whole file.

Requested change:

- Extract `fn escape(field: String) -> String` and make `to_line` use it.

Preserve (the hidden oracle checks these):

- `to_line` and `to_csv` stay the same functions of their input: a field with
  a comma, a double quote OR a newline is quoted, with inner quotes doubled;
  any other field is written unchanged.
- A pure refactor: escaping a plain field allocates nothing, as before.
