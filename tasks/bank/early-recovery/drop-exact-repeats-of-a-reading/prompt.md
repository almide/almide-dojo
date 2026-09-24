Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A reading that repeats the previous reading EXACTLY (same time and same
  value) is no longer fatal: `ingest` drops it and counts it in `dropped`.
- `append` is unchanged: it still returns `Repeat(t)`.

Preserve (the hidden oracle checks these on untouched inputs):

- A reading at the previous time with a DIFFERENT value is still `Repeat(t)`.
- A reading earlier than the previous one is still `Backwards(last, t)`, even
  if it equals some older reading.
- `BadReading` stays fatal; every dropped repeat is counted.
