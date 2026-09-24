Modify the program below. Return the whole file.

Requested change:

- Add `fn urgent_badge(ms: List[Mail], vips: List[String]) -> (String) -> String`
  returning a closure that, given a folder name, answers
  `<folder>: <n> urgent`.

Preserve (the hidden oracle checks these):

- `from_vip` and `unread` keep their exact behaviour.
- Urgent = unread AND (from a VIP OR flagged): a READ flagged message is not
  urgent.
- The closure captures only the count, never `ms` or `vips`.
