Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A frame may not knock down more than the 10 pins that are standing. `score`
  must fail with `frame <k> has more than 10 pins` (frames numbered 1-10) for
  a frame whose rolls knock down more pins than were standing.
- In frames 1-9 the two rolls of an open frame may sum to at most 10.
  In frame 10 the pins are reset after a strike or a spare: after a first-roll
  strike the next two rolls may sum to at most 10 unless the second is itself a
  strike; without a first-roll strike the first two rolls may sum to at most 10;
  a roll that comes right after a reset may be anything up to 10.

Preserve (the hidden oracle checks these on untouched inputs):

- `bad roll <n>` is checked on every roll first, as today.
- Frames are checked in order: a frame with too many pins is reported before any
  problem in a later frame (`incomplete game`, `too many rolls`).
- Strikes (one-roll frames), spares, a perfect game (300) and all scores are
  unchanged.
