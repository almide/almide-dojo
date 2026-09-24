Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A path may not climb above the root. If joining `rel` onto `base` would take
  a `..` above the root at any point, `resolve` (and so `resolve_all`) must
  fail with `<base> + <rel> escapes the root`, both paths as given
  (for example `a + ../../.. escapes the root`).

Preserve (the hidden oracle checks these on untouched inputs):

- The check is on the joined walk, base segments first: `rel` may go above
  `base` as long as it stays inside the root (`a/b + ../../c` is `c`), and
  reaching the root itself is fine (`.`).
- Escaping at any step is an error even when later segments come back down
  (`a + ../../a/b`), and a base that itself climbs above the root escapes too.
- `absolute path not allowed: <p>` and `empty segment in <p>` keep their text
  and come first (base checked before rel); `resolve_all` reports the first
  failing path.
