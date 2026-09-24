Modify the program below. Return the whole file.

Requested change:

- Extract `fn f_to_c(f: Int) -> Int` and make `celsius_of` use it.

Preserve (the hidden oracle checks these):

- `celsius_of` and `freezing` stay the same functions of their input: the
  conversion is (F - 32) * 5 / 9 with the division LAST (100F is 37C, 41F is
  5C, 33F is 0C).
- A pure refactor: the helper allocates nothing the inline arithmetic did not.
