Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An override whose value cannot be parsed for its setting's type is no longer
  fatal: a non-integer for an int setting, or anything but `true`/`false` for
  a bool setting. `load` leaves the setting as it was and appends the note
  `ignored <key>=<raw>: not an int` or `ignored <key>=<raw>: not a bool`.
- `parse_value` itself is unchanged and still returns its errors.

Preserve (the hidden oracle checks these on untouched inputs):

- An int that parses but is outside its range is still FATAL with its exact
  message (`bad value for <key>: <v> not in <lo>..<hi>`), even though that
  message starts like the unparseable-value message. Unknown settings
  (`unknown setting <key>`) and malformed lines (`malformed: <line>`) stay fatal,
  wherever they appear in the list.
- "As it was" means the value before that line: the default, or an earlier
  override that was applied. Recovery never resets a setting to its default.
- Notes stay in line order, `set ...` and `ignored ...` interleaved; comments and
  blank lines add no note. Range bounds are inclusive.
