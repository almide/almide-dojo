Modify the program below. Return the whole file.

Requested change:

- Extract `fn bracket(age: Int) -> Int` (0 child, 1 teen, 2 adult, 3 senior)
  and make both `price` and `label` use it.

Preserve (the hidden oracle checks these):

- `price` and `label` stay the same functions of their input, at every
  boundary: 13 is a teen, 18 an adult, 65 a senior.
- A pure refactor: the helper allocates nothing the inline test did not.
