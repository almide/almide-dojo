Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A hunk's body must match its header: the old side has the context and removed
  lines, the new side the context and added lines. When they differ from the
  header's counts, `hunks` (and so `stat`) fails with
  `hunk <k> has <old>/<new> lines, header says <b>/<d>`
  (for example `hunk 1 has 2/3 lines, header says 2/2`).

Preserve (the hidden oracle checks these on untouched inputs):

- `\` marker lines ("\ No newline at end of file") count on neither side.
- A missing count in the header means 1; a count of 0 is fine.
- Every line is read first with the existing checks and messages (the first bad
  line wins, wherever it is); the counts are compared afterwards, hunk by hunk,
  and the first mismatching hunk is reported.
