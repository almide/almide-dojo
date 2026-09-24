Modify the program below. Return the whole file.

Requested change:

- Extract `fn fields(spec: String) -> List[String]` (the trimmed names) and
  make both `require` and `count_required` use it.

Preserve (the hidden oracle checks these):

- `require` and `count_required` stay the same functions of their input: an
  empty or all-space spec has ZERO fields, and the empty name is then not
  required.
- A pure refactor: the helper allocates no more than the inline code did.
