Modify the program below. Return the whole file.

Requested change:

- Add `fn titles(docs: List[List[String]]) -> List[String]` returning, for each
  document in order, the text of its FIRST level-1 heading, or `(untitled)`
  when it has none.

Preserve (the hidden oracle checks these):

- `heading_level`, `headings` and `outline` keep their exact behaviour.
- A title is a level-1 heading as `heading_level` defines it: "#tag" is not a
  heading and "## Sub" is level 2, so neither is a title.
- Each document's heading list is a temporary of that document's step; the
  batch keeps only the titles.
