Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A reading lower than the meter's last reading is no longer fatal: it means
  the meter was replaced. `consume` counts it in `replaced`, takes that reading
  as the new last reading, and adds no consumption for it.
- `advance` is unchanged: it still returns `reading went backwards on ...`.

Preserve (the hidden oracle checks these on untouched inputs):

- Consumption already counted for that meter is kept; later increases add to
  it as usual.
- A reading equal to the last one is an ordinary reading (no consumption, not a
  replacement).
- `bad line: <line>`, `bad reading: <line>` and `unknown meter <id>` stay fatal,
  before or after a replacement; the first failing line wins.
- `bill` output is unchanged apart from the `(<n> replaced)` counts.
