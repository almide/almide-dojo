Modify the program below. Return the whole file.

Requested change:

- Add `fn page_label(pages: List[Int]) -> (String) -> String` returning a
  closure that, given a prefix, answers `<prefix><lo>-<hi>` for the lowest and
  highest cited page, `<prefix><p>` when they are the same page, or
  `<prefix>none` when nothing is cited.

Preserve (the hidden oracle checks these):

- `cited` and `citation_count` keep their exact behaviour.
- A single page (or the same page cited several times) is written once
  (`p. 7`), never as `7-7`.
- The closure captures only the two ends, never `pages`.
