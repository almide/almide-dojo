Modify the program below. Return the whole file.

Requested change:

- Extract `fn names(mask: Int) -> List[String]` and make both `describe` and
  `can` use it.

Preserve (the hidden oracle checks these):

- `describe` and `can` stay the same functions of their input: names come
  from the lowest bit up ("read+exec", never "exec+read"); bits above 3 are
  ignored.
- A pure refactor: the helper allocates no more than the inline code did.
