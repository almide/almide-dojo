Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Guarded: Store = { inner: Mem, writable: List[String] }` where
  each entry of `writable` is a directory such as `tmp/` (always ending in `/`). A write
  is allowed only when the key STARTS WITH one of them; any other write fails with
  `read-only: <key>` and `inner` is not asked. Reads always go to `inner`.
- Add `type Mode = | Open(Mem) | Locked(Guarded)` and
  `fn run(m: Mode, writes: List[(String, String)], keys: List[String]) -> String!` that
  applies the writes with the generic `apply` and then `dump`s `keys`.

Preserve (the hidden oracle checks these):

- `Mem`, `apply`, `dump` and the protocol keep their behaviour (`empty key`, first
  failure aborts the whole batch).
- Only a key that begins with a writable directory is writable: `x/tmp/a` and `tmp`
  (no slash) are read-only when `tmp/` is writable.
- The guard is checked before `inner`: an empty key through `Guarded` is `read-only: `.
