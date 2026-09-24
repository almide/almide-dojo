Modify the program below. Return the whole file.

Requested change:

- Add `fn sentence_counts(docs: List[String]) -> List[String]` returning, for
  each document in order, the sentence count of each of its paragraphs joined
  by `,` (`""` for a document with no paragraphs).

Preserve (the hidden oracle checks these):

- `is_end`, `sentences` and `paragraphs` keep their exact behaviour: "Wait..."
  is ONE sentence and "Really?!" is one sentence.
- Each document's paragraph list is a temporary of that document's step.
