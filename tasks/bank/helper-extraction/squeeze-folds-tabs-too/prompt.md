Modify the program below. Return the whole file.

Requested change:

- Extract `fn words(s: String) -> List[String]` (the words, split on runs of
  spaces and tabs) and make both `clean_title` and `clean_tag` use it.

Preserve (the hidden oracle checks these):

- `clean_title` and `clean_tag` stay the same functions of their input: a tab
  separates words exactly like a space.
- A pure refactor: the helper allocates no more than the inline code did.
