Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- PORT becomes optional: when it is not set, `load` uses 8080 and adds the
  note `PORT not set, using 8080`.
- `port` is unchanged: it still returns `Missing("PORT")` for an unset PORT.

Preserve (the hidden oracle checks these on untouched inputs):

- Only an unset PORT gets the default. A PORT that is set but is not a valid
  port (including an empty value) is still `Invalid("PORT", <raw>)`.
- The default is a port like any other: ADMIN_PORT may not be equal to it
  (`Clash("ADMIN_PORT", "PORT")`). ADMIN_PORT stays required.
- The checks keep their order (PORT, ADMIN_PORT, the clash, WORKERS), and the
  notes come in that order too.
