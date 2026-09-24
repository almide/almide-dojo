Modify the program below. Return the whole file.

Requested change:

- Add `fn tag_summary(tags: List[String]) -> (String) -> String` returning a
  closure that, given a label, answers `<label>: <n> tags`, n being the number
  of DIFFERENT tags (ignoring empty ones).

Preserve (the hidden oracle checks these):

- `norm`, `same_tag` and `tagged` keep their exact behaviour.
- Tags are counted the way `same_tag` compares them: "Rust", " rust " and
  "RUST" are one tag. A tag that is empty after trimming does not count.
- The closure captures only the count, never `tags`.
