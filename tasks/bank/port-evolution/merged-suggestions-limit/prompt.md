Modify the program below. Return the whole file.

Requested change:

- Add a composite `type Combined: Speller = { main: Table, extra: Table, limit: Int }`.
  Its suggestions are `main`'s followed by `extra`'s, with repeats removed (a word
  keeps its FIRST position), never the looked-up word itself, and at most `limit` of them.
- Add `type Checker = | Plain(Table) | Both(Combined)` and
  `fn hints(c: Checker, words: List[String], n: Int) -> List[String]` that runs the
  generic `hint` for each word in order.

Preserve (the hidden oracle checks these):

- `Table`, `hint` and the protocol keep their behaviour.
- Repeats are removed BEFORE the limit is applied: when `main` and `extra` share
  words, `Combined` still returns `limit` suggestions if enough distinct ones exist.
- `main`'s order comes first; a word that appears in both lists stays at its position
  in `main`.
- `limit = 0` or no candidates gives `(none)`.
