Modify the program below. Return the whole file.

Requested change:

- Add `fn jump_ranking(sensors: List[Sensor]) -> List[String]` returning `show`
  of every sensor, ordered by largest jump, biggest first.

Preserve (the hidden oracle checks these):

- `jumps`, `largest_jump` and `show` keep their exact behaviour.
- Sensors with the same largest jump keep their input order.
- Sensors with no jump (`n/a`, fewer than two readings) come AFTER every
  sensor that has a jump — including sensors whose largest jump is 0 — and
  keep their input order among themselves.
- Each sensor's jump list is a temporary of that sensor's step; the ranking
  keeps only one number per sensor.
