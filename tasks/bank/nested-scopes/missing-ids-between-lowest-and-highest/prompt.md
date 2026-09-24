Modify the program below. Return the whole file.

Requested change:

- Add `fn gaps(streams: List[String]) -> List[Int]` returning, for each stream
  in order, how many ids are missing between the LOWEST and the HIGHEST id
  received.

Preserve (the hidden oracle checks these):

- `ids`, `received` and `first_arrival` keep their exact behaviour.
- The range is lowest to highest id, NOT first to last arrival; duplicates
  count once. An empty stream has 0 missing.
- Each stream's id list is a temporary of that stream's step.
