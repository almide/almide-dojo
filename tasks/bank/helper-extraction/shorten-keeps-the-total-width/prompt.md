Modify the program below. Return the whole file.

Requested change:

- Extract `fn shorten(label: String, width: Int) -> String` (the label, or its
  shortened form when too long) and make both `cell` and `title` use it.

Preserve (the hidden oracle checks these):

- `cell` and `title` stay the same functions of their input: a shortened
  label is EXACTLY `width` characters including the "~".
- A pure refactor: the helper allocates no more than the inline code did.
