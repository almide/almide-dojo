Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type Relaxed: Directory = { inner: Exact }` that ignores letter case
  and surrounding spaces: `find(" ALICE ")` finds an entry stored as `Alice`. When
  several stored names match that way, the FIRST stored one wins.
- Add `type Mode = | Strict(Exact) | Loose(Relaxed)` and
  `fn lookup_with(m: Mode, names: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Exact`, `lookup_all`, `dial` and the protocol keep their behaviour (exact, case-sensitive;
  `dial` errors with the name as asked).
- Case is ignored on BOTH sides: stored names are not necessarily lowercase
  (`McDonald` is found by `mcdonald` and by `MCDONALD`).
- A name with different letters is still unknown; the answer line shows the name as asked.
