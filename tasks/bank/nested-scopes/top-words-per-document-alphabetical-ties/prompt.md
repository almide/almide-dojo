Modify the program below. Return the whole file.

Requested change:

- Add `fn top_words(docs: List[String]) -> List[String]` returning, for each
  document in order, its three most frequent words joined by `,` (fewer when
  the document has fewer distinct words; `""` for none).

Preserve (the hidden oracle checks these):

- `words`, `frequencies` and `word_count` keep their exact behaviour.
- More frequent words first; words with the SAME frequency in alphabetical
  order (not in order of appearance).
- Each document's frequency table is a temporary of that document's step.
