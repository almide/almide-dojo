Modify the program below. Return the whole file.

Requested change:

- Add `fn longest_rises(seqs: List[String]) -> List[Int]` returning, for each
  sequence in order, the length of its longest rising run (1 for a single
  value, 0 for an empty sequence).

Preserve (the hidden oracle checks these):

- `values` and `rises` keep their exact behaviour.
- A run never continues from one sequence into the next: every sequence is
  measured on its own.
- Each sequence's value list is a temporary of that sequence's step.
