Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A `Moved` page is no longer fatal: `fetch_all` follows it to the new url, and
  keeps following, up to THREE moves per requested url.
- Add two cases to `WebErr`: `TooManyMoves(String)` (the requested url) when a
  fourth move would be needed, and `MoveLoop(String)` (the url reached a second
  time) when a move leads back to a url already visited in this chain.
- `get` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- A loop is reported as `MoveLoop` as soon as it is detected, even when fewer
  than three moves have been followed; a url moving to itself is a loop.
- `Gone` and `NoPage` stay fatal and name the url where they happened (the end of
  the chain).
- Every requested url starts a fresh chain with its own three moves; results keep
  the order of `urls` and the first failing url wins.
