Modify the program below. Return the whole file.

Requested change:

- Extract `fn expand(c: String) -> String?` returning the six hex digits of a
  colour (`"ff8800"` for both "#f80" and "#FF8800" in its own case), or `none`
  when it is not a colour shape, and use it in `red` and `is_colour`.

Preserve (the hidden oracle checks these):

- `red` and `is_colour` stay the same functions of their input: the "#rgb"
  shorthand is accepted everywhere the long form is; hex digits in any case.
- A pure refactor: the helper allocates no more than the inline code did.
