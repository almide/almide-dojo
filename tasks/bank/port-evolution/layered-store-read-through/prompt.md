Modify the program below. Return the whole file.

Requested change:

- Add a third adapter `type Layered: Store = { front: MemStore, back: RemoteStore }`.
  Its `get` consults `front` first: a hit there is the answer; on a miss it asks
  `back` and returns whatever `back` returns.
- Add `type Source = | Local(MemStore) | Remote(RemoteStore) | Both(Layered)` and
  `fn fetch_all_via(src: Source, keys: List[String]) -> List[String]!` that runs the
  generic `fetch_all` with whichever adapter the source holds.

Preserve (the hidden oracle checks these):

- The `Store` protocol, both existing adapters, `describe` and `fetch_all` keep their
  exact behaviour and signatures.
- A miss stays a miss: a key absent from both layers is `ok(none)` from
  `Layered.get` (so `fetch_all` skips it), never an error and never an empty string.
- An error from `back` passes through unchanged (`remote timeout: <key>`), and
  `fetch_all_via` stops at the FIRST failing key in key order.
- `back` is consulted ONLY on a front miss: a key that `front` has answers from
  `front` even when that key is on a down shard of `back`.
