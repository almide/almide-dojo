Modify the program below. Return the whole file.

Requested change:

- Extract `fn esc(s: String) -> String` and make both `text_node` and
  `attribute` use it.

Preserve (the hidden oracle checks these):

- `text_node` and `attribute` stay the same functions of their input: every
  character is escaped exactly once ("<" becomes "&lt;", never "&amp;lt;").
- A pure refactor: the helper allocates no more than the inline code did.
