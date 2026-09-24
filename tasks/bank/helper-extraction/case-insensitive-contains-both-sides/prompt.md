Modify the program below. Return the whole file.

Requested change:

- Extract the test into `fn contains_ci(hay: String, needle: String) -> Bool`
  and make both `search` and `count_matches` use it.

Preserve (the hidden oracle checks these):

- `search` and `count_matches` stay the same functions of their input: case
  is ignored in the title AND in the query.
- `contains_ci` ignores the case of both arguments.
- A pure refactor: the helper allocates no more than the inline test did.
