Modify the program below. Return the whole file.

Requested change:

- Extract `fn sort_key(title: String) -> String` and make `shelve` use it.

Preserve (the hidden oracle checks these):

- `shelve` and `first_on_shelf` stay the same functions of their input: only
  a leading "The " or "A " WORD is ignored ("Theatre" and "Avalon" keep all
  their letters); case does not matter; ties keep input order.
- A pure refactor: the helper allocates no more than the inline key did.
