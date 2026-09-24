Modify the program below. Return the whole file.

Requested change:

- Extract `fn plural(word: String) -> String` and make both `count_label` and
  `heading` use it.

Preserve (the hidden oracle checks these):

- `count_label` and `heading` stay the same functions of their input: a final
  "y" becomes "ies" ONLY after a consonant ("days", "keys", "toys" keep
  their "y").
- A pure refactor: the helper allocates no more than the inline code did.
