Modify the program below. Return the whole file.

Requested change:

- Add `fn progress_bar(items: List[Item]) -> (Int) -> String` returning a
  closure that, given a width, renders `<bar> <p>%`: the bar is `width`
  characters, the first `floor(done * width / total)` of them `#` and the rest
  `-`. `p` is the done percentage ROUNDED TO THE NEAREST integer (halves round
  up). With no items the closure answers `no tasks`.

Preserve (the hidden oracle checks these):

- `is_done`, `done_count`, `open_titles` and `status` keep their exact behaviour.
- The percentage rounds to nearest (2 of 3 is 67%, 1 of 3 is 33%, 1 of 8 is
  13%); the bar rounds down. A width of 0 gives an empty bar (` 50%`).
- The closure captures only the two counts, never `items`.
