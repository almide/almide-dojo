Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A batch refused as `TooLarge` is no longer fatal: `upload` splits it into
  two halves (the first half gets the extra record when the count is odd) and
  sends each half, first half first, splitting again as needed.
- A single record that is too large on its own cannot be split: that
  `TooLarge(1, size)` is fatal.
- `send` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- Records keep their order across the batches actually sent.
- `BadRecord` stays fatal (the server checks records before sizes).
- Batches that fit are sent as they are.
