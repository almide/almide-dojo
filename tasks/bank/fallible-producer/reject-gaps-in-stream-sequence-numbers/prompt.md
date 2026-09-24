Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Sequence numbers may not skip: each stream's messages must be numbered 1, 2,
  3, ... in arrival order. A message whose number is larger than the next
  expected one fails with `missing seq <expected> in stream <stream>`
  (for example `missing seq 2 in stream a` for `a 1 ...` then `a 3 ...`).

Preserve (the hidden oracle checks these on untouched inputs):

- Numbering is per stream, and every stream's FIRST message must be number 1
  (a stream that starts at 4 is missing 1).
- A number that is not larger than the previous one is still
  `duplicate seq <n> in stream <s>`; `bad line` and `bad seq` keep their text.
- The first failing line wins; the reassembled output is unchanged.
