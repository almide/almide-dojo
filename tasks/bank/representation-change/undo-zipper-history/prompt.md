Modify the program below. Return the whole file.

Requested change:

- Store the history as a zipper: change `Doc` to
  `type Doc: Eq, Repr = { past: List[String], now: String, future: List[String] }` where
  `past` holds the earlier states NEWEST FIRST and `future` the redoable states in
  redo order. No index remains. `doc(initial)` has empty past and future.
- Every function keeps its signature and result.

Preserve (the hidden oracle checks these):

- A new edit after some undos DISCARDS the redoable states: `can_redo` is false and
  `redo` does nothing afterwards.
- `undo` at the start and `redo` at the end change nothing.
- `timeline` lists the states oldest first with the current one bracketed.
