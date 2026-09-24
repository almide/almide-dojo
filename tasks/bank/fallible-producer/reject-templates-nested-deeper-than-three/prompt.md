Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Blocks may be nested at most 3 deep. Opening a block while 3 blocks are
  already open fails with `nesting deeper than 3 at <pos>`, `<pos>` the
  position of the block that goes too deep.

Preserve (the hidden oracle checks these on untouched inputs):

- Depth is the number of blocks open at that point; closed sibling blocks do
  not count. Exactly three levels are fine.
- Tags are split out of the whole template first (`unclosed tag` comes first,
  wherever it is), then checked left to right: the first problem wins, whether
  it is the depth or an existing message. Within one opening tag, the block
  name is checked before the depth.
- Summaries of valid templates are unchanged.
