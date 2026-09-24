Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A formula term that refers to an empty cell is no longer fatal: it reads as
  `0` and adds the warning `<cell>: <ref> is empty, using 0`, where `<cell>` is
  the cell whose formula contains the reference (for example
  `B1: A2 is empty, using 0`).

Preserve (the hidden oracle checks these on untouched inputs):

- `BadLiteral` and `Cycle` stay fatal with their payloads, including when they
  are found by following a reference, and including cycles that pass through
  a formula that also has an empty reference.
- Only a reference term can be empty-and-0. Asking directly for an empty cell
  in `cells` is still `BadLiteral(cell)`.
- Warnings are produced in evaluation order: terms left to right, depth first,
  cells in the order given. A reference that is reached again produces its
  warning again, with no deduplication.
