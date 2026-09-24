Modify the program below. Return the whole file.

Requested change:

- Extract `fn args(line: String) -> List[String]` (the arguments, quotes
  honoured and removed) and make `arg_count` use it.

Preserve (the hidden oracle checks these):

- `arg_count` and `command` stay the same functions of their input: spaces
  inside double quotes do not split an argument.
- A pure refactor: the helper allocates no more than the inline scan did.
