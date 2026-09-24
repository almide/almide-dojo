Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A reading whose VALUE is not a number is no longer fatal: it is skipped and
  counted in that sensor's `skipped`, and `summary` shows `(<n> skipped)`.
- Each sensor may skip at most two readings. Its third bad value is fatal:
  `too many bad values for <sensor>: <line>`.
- `parse_reading` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- The budget is per sensor: two bad values for each of several sensors are fine.
- A sensor whose readings so far were all skipped is still listed, in order of
  first appearance, as `<sensor> 0x mean n/a (<n> skipped)`.
- A skipped reading is not a reading: it neither counts toward the mean nor
  moves the sensor's last minute. The order check (`time went backwards ...`)
  applies to the readings that are kept.
- `wrong field count: <line>` and `bad minute in: <line>` stay fatal.
