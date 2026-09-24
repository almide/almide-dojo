Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Every measure must fill exactly one bar of the time signature. A measure
  that does not fails with `measure <k> has <n>/16, expected <bar>/16`.
- The LAST measure is the exception: it may be shorter than a bar, but not
  longer.

Preserve (the hidden oracle checks these on untouched inputs):

- Too short and too long both count for every measure but the last; a
  single-measure piece may be short.
- Durations are the existing ones (dots and rests included).
- Measures are checked in order, and within a measure its notes are read
  (`bad note`, `empty measure`) before its length is compared; existing
  messages and the `length` output are unchanged.
