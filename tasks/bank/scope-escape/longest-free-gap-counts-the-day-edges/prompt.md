Modify the program below. Return the whole file.

Requested change:

- Add `fn longest_free(ss: List[String]) -> String` returning `free=<minutes>`
  for the longest stretch of the working day not covered by any block, or the
  `parse_blocks` error.

Preserve (the hidden oracle checks these):

- `parse_block`, `parse_blocks` and `busy_count` keep their exact behaviour.
- The stretches before the first block (from 540) and after the last block
  (until 1020) count too; parts of blocks outside the day are ignored. No
  blocks: `free=480`.
- The sorted block list is a temporary of `longest_free`: return only the
  string.
