Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A frame whose checksum does not match is no longer fatal: `decode` drops
  that whole frame (its length byte, payload and checksum), counts it in
  `dropped`, and continues with the next frame.
- `read_frame` is unchanged: it still returns `BadChecksum { at, want, got }`.

Preserve (the hidden oracle checks these on untouched inputs):

- `ZeroLength` and `Truncated` stay fatal with their exact payloads, also after
  a dropped frame. A frame whose length runs past the end of the stream is
  `Truncated`, not a checksum problem.
- The next frame starts right after the dropped frame's checksum byte, as
  given by the dropped frame's own length byte; bytes inside a dropped frame
  are never read as frames.
- Good frames keep their order; a stream may end with a dropped frame; an empty
  stream decodes to no frames.
