Modify the program below. Return the whole file.

Requested change:

- Extract `fn compare(a: String, b: String) -> Int` (1 when `a` is newer, -1
  when `b` is newer, 0 when they are the same version) and make `newer` use it.

Preserve (the hidden oracle checks these):

- `newer` and `latest` stay the same functions of their input.
- A pre-release is OLDER than the release with the same numbers
  ("1.0.0-rc1" < "1.0.0"); pre-releases of the same numbers compare by tag.
- A pure refactor: comparing allocates no more than the inline code did.
