Modify the program below. Return the whole file.

Requested change:

- Extract the shared splitting into `fn segments(p: String) -> List[String]`
  (the non-empty segments, in order) and make BOTH `depth` and `basename` use it.

Preserve (the hidden oracle checks these):

- `depth` and `basename` stay the same functions of their input: `depth`
  ignores "." segments, `basename` keeps them ("a/." has basename ".").
- `segments` drops only empty segments.
- A pure refactor: the helper allocates no more than the inline splitting did.
