Modify the program below. Return the whole file.

Requested change:

- Add `fn time_above(ss: List[String], limit: Int) -> String` returning
  `above=<seconds>/<total seconds>`: how long the value was strictly above
  `limit`, out of the time from the first to the last sample.

Preserve (the hidden oracle checks these):

- `parse_sample`, `samples` and `peak` keep their exact behaviour.
- Time is weighted by DURATION: a sample counts for the seconds until the
  next sample, not once per sample. Malformed samples are skipped.
- The interval list is a temporary of `time_above`: return only the string.
