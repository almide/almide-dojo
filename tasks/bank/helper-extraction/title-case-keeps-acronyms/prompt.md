Modify the program below. Return the whole file.

Requested change:

- Extract `fn title_word(w: String) -> String` (one word) and make both
  `heading` and `menu_item` use it.

Preserve (the hidden oracle checks these):

- `heading` and `menu_item` stay the same functions of their input: an
  all-capitals word is kept as written ("HTTP API" stays), any other word is
  capitalized with the rest lowercased ("hELLO" becomes "Hello").
- A pure refactor: the helper allocates no more than the inline code did.
