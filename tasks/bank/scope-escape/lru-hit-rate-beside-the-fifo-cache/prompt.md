Modify the program below. Return the whole file.

Requested change:

- Add `fn lru_stats(capacity: Int, requests: List[String]) -> String` returning
  `hits=<h>,misses=<m>` for an LRU cache over the same trace.

Preserve (the hidden oracle checks these):

- `fifo_misses` and `fifo_report` keep their exact behaviour.
- LRU semantics: when full, the LEAST RECENTLY USED key is evicted, and a hit
  makes that key the most recently used. Capacity 0 (or less): every request
  is a miss.
- The simulated cache is a temporary of `lru_stats`: return only the string.
