Modify the program below. Return the whole file.

Requested change:

- Extract the cleaning into `fn clean(n: String) -> String` and make both
  `same_number` and `dial_string` use it.

Preserve (the hidden oracle checks these):

- `same_number` and `dial_string` stay the same functions of their input:
  only spaces, dashes and parentheses are removed; a leading "+" stays, so
  "+44 20" and "44 20" are different numbers.
- A pure refactor: the helper allocates no more than the inline cleaning did.
