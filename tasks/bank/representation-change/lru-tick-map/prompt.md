Modify the program below. Return the whole file.

Requested change:

- Replace the recency list with use stamps: change `Cache` to
  `type Cache: Eq, Repr = { cap: Int, values: Map[String, String], used: Map[String, Int], clock: Int }`.
  Every `get` hit and every `put` takes the next `clock` value as the key's stamp; the
  least recently used key is the one with the SMALLEST stamp.
- Every function keeps its signature and result.

Preserve (the hidden oracle checks these):

- A `get` hit counts as a use: after `put a, put b, get a, put c` with capacity 2, `b`
  is evicted (not `a`). A `get` miss changes nothing.
- Re-putting an existing key updates its value, counts as a use, and never evicts.
- `recency` lists the keys from least to most recently used.
