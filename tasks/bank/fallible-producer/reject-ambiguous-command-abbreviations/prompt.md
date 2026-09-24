Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An abbreviation that could mean more than one command is no longer resolved
  to the first match. `resolve` (and so `expand`) fails with
  `ambiguous <word>: <command>, <command>, ...`, listing every command it could
  mean, in table order.

Preserve (the hidden oracle checks these on untouched inputs):

- A word that is a whole command name means that command, even when longer
  commands start with it. Aliases are looked up first and are never ambiguous.
- An unknown word keeps its existing error. Lines are expanded in order and the
  first failing line wins.
- `expand` output is unchanged for words that mean one command.
