Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Every rank must describe exactly 8 squares. A rank that describes another
  number fails with `rank <k> has <n> squares` (for example
  `rank 4 has 7 squares`), `<k>` numbered as in the existing messages.

Preserve (the hidden oracle checks these on untouched inputs):

- A digit counts as that many empty squares and a piece as one: `4P3` is 8
  squares. Adjacent digits add up (`44` is 8).
- The rank-count check comes first; then ranks are checked in order from rank 8
  down to rank 1, and within one rank the bad-square check comes before the
  square count.
- Existing messages and the piece counts are unchanged.
