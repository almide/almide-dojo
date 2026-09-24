Modify the program below. Return the whole file.

Requested change:

- Add `fn recent(h: List[String], k: Int) -> String` returning the `k` most
  recent DISTINCT queries, most recent first, joined by ` | ` (fewer if there
  are fewer distinct queries; `""` for k <= 0).

Preserve (the hidden oracle checks these):

- `history_len`, `searched` and `first_search` keep their exact behaviour.
- A query searched again moves to the front: its position is its LATEST
  search. Each query appears once.
- The distinct list is a temporary of `recent`: return only the string.
