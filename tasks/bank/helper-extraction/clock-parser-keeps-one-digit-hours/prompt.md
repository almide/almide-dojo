Modify the program below. Return the whole file.

Requested change:

- Extract the parsing of one clock time into `fn clock(t: String) -> Int?`
  (minutes after midnight, `none` when invalid) and make `duration` use it for
  both times.

Preserve (the hidden oracle checks these):

- `duration` and `total` stay the same functions of their input: a one-digit
  hour ("9:05") is valid, minutes must be exactly two digits ("9:5" is
  invalid), hours 0-23 and minutes 0-59.
- A pure refactor: the helper allocates no more than the inline parsing did.
