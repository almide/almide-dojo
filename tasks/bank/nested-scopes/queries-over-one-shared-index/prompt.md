Modify the program below. Return the whole file.

Requested change:

- Add `fn search_all(docs: List[String], queries: List[String]) -> List[String]`
  answering each query in order with the ids of the documents that contain
  EVERY word of the query, joined by `,` (`""` for none).

Preserve (the hidden oracle checks these):

- `doc_words`, `build_index` and `docs_with` keep their exact behaviour.
- A multi-word query needs ALL its words in the same document; words match
  case-insensitively. A query with no words matches nothing.
- Build the index ONCE for the whole batch (shared outer data read by every
  query); each query's candidate list is a temporary of that query's step.
