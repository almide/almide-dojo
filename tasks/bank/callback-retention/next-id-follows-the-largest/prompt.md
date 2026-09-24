Modify the program below. Return the whole file.

Requested change:

- Add `fn allocator(ids: List[String]) -> (String) -> String` returning a
  closure that, given a prefix, answers `<prefix>T-<n>` for the next free
  ticket number: one more than the LARGEST existing number (1 when there is
  none).

Preserve (the hidden oracle checks these):

- `number`, `valid` and `has` keep their exact behaviour.
- Gaps are not reused: with T-1 and T-7 the next is T-8, not T-3.
  Malformed ids are ignored.
- The closure captures only the next number, never `ids`.
