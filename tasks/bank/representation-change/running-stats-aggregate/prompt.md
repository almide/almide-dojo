Modify the program below. Return the whole file.

Requested change:

- Stop keeping every sample: replace `Sensor.samples: List[Int]` with an aggregate
  `Sensor.stats: Stats` where `type Stats: Eq, Repr = { count: Int, sum: Int, lo: Int, hi: Int }`
  is updated as samples arrive. `sensor`, `record`, `record_all`, `merge` and every
  reader keep their signatures.

Preserve (the hidden oracle checks these):

- `low`, `high` and `mean` are `none` before the first sample and exactly the old
  answers after it, whatever the signs: with only positive samples the low is the
  smallest of them (not 0), with only negative samples the high is the largest of
  them (not 0).
- `mean` still truncates toward zero (`[-7, 0]` has mean -3).
- `merge` of a sensor with an empty one changes nothing; merging two non-empty ones
  gives the combined count, sum, low and high.
- `summary` keeps its format (`- ` for a missing value).
