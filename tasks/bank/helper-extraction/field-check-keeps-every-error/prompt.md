Modify the program below. Return the whole file.

Requested change:

- Extract the per-field rule into `fn check_field(f: Field) -> Result[Unit, String]`
  (`ok(())` for a good field, `err(<message>)` otherwise) and make
  `check_form` use it.

Preserve (the hidden oracle checks these):

- `check_form` still reports EVERY failing field, in field order, with the
  same messages — one failing field never hides a later one.
- `is_valid` is unchanged.
- A pure refactor: checking a GOOD field allocates nothing, as before.
