Modify the program below. Return the whole file.

Requested change:

- Add a second adapter `type FallbackRepo: Repo = { inner: MemRepo, fallback: String }`.
  Its `find` returns the inner hit when there is one; on a miss it returns
  `some(fallback)` when `fallback` is non-empty, and `none` when it is empty.
- Add `type Backend = | Mem(MemRepo) | Fallback(FallbackRepo)` and
  `fn greet_via(b: Backend, id: String) -> String` that dispatches to `greet`
  with whichever adapter the backend holds.

Preserve (the hidden oracle checks these):

- `MemRepo.find`, `greet` and the `Repo` protocol keep their exact behaviour and signatures.
- A miss is a miss: `greet` must still answer `who?` through every adapter that
  has nothing to say. Do not turn `none` into an empty name.
