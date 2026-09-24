Modify the program below. Return the whole file.

Requested change:

- Extract `fn luhn_sum(s: String) -> Int` (the weighted sum) and make both
  `valid` and `check_digit` use it.

Preserve (the hidden oracle checks these):

- `valid` and `check_digit` stay the same functions of their input for
  numbers of ANY length, odd or even: positions are counted from the RIGHT.
- A pure refactor: the helper allocates no more than the inline code did.
