Modify the program below. Return the whole file.

Requested change:

- Keep counts instead of readings: change `Hist` to
  `type Hist: Eq, Repr = { width: Int, counts: Map[Int, Int] }` where a key is a bucket
  START and the value how many readings fell in it (only non-empty buckets are stored).
- Add `fn busiest(h: Hist) -> Int?`: the start of the bucket with the most readings, the
  LOWEST such start on a tie, none for an empty histogram.

Preserve (the hidden oracle checks these):

- Buckets below zero are real buckets: with width 10, -1 and -10 are in `-10..-1`,
  -11 is in `-20..-11`, and 0 is in `0..9` (the start is the multiple of `width` at or
  BELOW the reading).
- `render` lists buckets from the lowest start up, whatever order readings arrived in.
- `count_in(h, v)` is the count of v's bucket, 0 when it is empty.
