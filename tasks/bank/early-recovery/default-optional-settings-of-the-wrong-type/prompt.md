Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An OPTIONAL setting whose value has the wrong type is no longer fatal:
  `load` uses the schema default for it and adds the warning
  `<path>: <raw> is not <kind>, using <default>`.
- `coerce` is unchanged: it still returns `WrongType(path, kind, raw)`.

Preserve (the hidden oracle checks these on untouched inputs):

- A REQUIRED setting of the wrong type is still fatal with its `WrongType`.
- `Syntax`, `UnknownKey` and `Missing` stay fatal.
- The last assignment of a key is the one used and checked, as today.
- Values and warnings follow schema order.
