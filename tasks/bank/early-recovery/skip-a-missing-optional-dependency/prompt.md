Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An OPTIONAL dependency that is not in the registry is no longer fatal: the
  plan leaves it out and appends `<dep> (optional for <package>)` to `skipped`
  (for example `extras (optional for app)`).

Preserve (the hidden oracle checks these on untouched inputs):

- Only the optional dependency's OWN absence is recoverable. An optional
  dependency that exists is planned like any other, and anything that goes
  wrong below it (a missing required package deeper down, a cycle) is fatal with
  its exact message.
- Missing required packages (`missing package <name> (required by <parent>)`,
  including the root) and cycles (`cycle: a -> b -> a`) stay fatal.
- `skipped` lists entries in depth-first visiting order, optional-missing and
  other-platform entries interleaved; the install order is unchanged.
