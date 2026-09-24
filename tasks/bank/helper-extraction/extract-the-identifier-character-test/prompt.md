Modify the program below. Return the whole file.

Requested change:

- Extract the "may continue an identifier" test into
  `fn ident_continue(c: String) -> Bool` and use it in `lex`.

Preserve (the hidden oracle checks these):

- `tokens` stays the same function of its input. Identifiers are ASCII
  lowercase only: an uppercase letter or a non-ASCII letter is NOT an
  identifier character and becomes its own one-character token.
- `ident_continue` is true exactly for lowercase ASCII letters, ASCII digits
  and "_".
- A pure refactor: the helper allocates nothing the inline test did not.
