Modify the program below. Return the whole file.

Requested change:

- Add a caching decorator
  `type Cached: Lookup = { inner: Directory, memo: Map[String, String?], hits: Int }`
  and `fn cached(d: Directory) -> Cached` (empty memo, zero hits). Its `get` answers
  from `memo` when the key has been looked up before (counting a hit), and otherwise
  asks `inner` once and remembers the answer.
- Add `fn resolve_cached(d: Directory, keys: List[String]) -> (List[String], Int, Int)`
  returning the resolved values, the number of calls that reached the directory, and
  the number of cache hits.

Preserve (the hidden oracle checks these):

- `Directory`, `resolve_all` and the protocol keep their exact behaviour.
- A MISS is remembered too: asking for a missing key a second time is a hit and
  does not reach the directory again; it still reads `-`.
- Values are returned exactly, including the empty string, and a key's first
  lookup is never counted as a hit.
