Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A name already in the book (compared case-insensitively) is no longer fatal:
  the first entry is kept, the line is ignored, and the warning
  `line <n>: duplicate <name> ignored` is added (name as written on that line).

Preserve (the hidden oracle checks these on untouched inputs):

- The line is still checked in its existing order: `missing colon`, then
  `bad phone` (fatal even on a repeated name), then the repeat.
- An ignored line adds only its duplicate warning: no `normalized` warning for it.
- Warnings keep line order, `normalized` and `duplicate` warnings interleaved.
