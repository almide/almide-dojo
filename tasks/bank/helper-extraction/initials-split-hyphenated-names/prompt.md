Modify the program below. Return the whole file.

Requested change:

- Extract `fn initials(name: String) -> String` and make both `avatar` and
  `signature` use it.

Preserve (the hidden oracle checks these):

- `avatar` and `signature` stay the same functions of their input: a hyphen
  separates name parts just like a space ("Jean-Luc" gives "JL").
- A pure refactor: the helper allocates no more than the inline code did.
