Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- The digits before the "." may not start with a 0 unless that 0 is the only
  digit there ("0", "0.5" and "-0" are fine; "01" and "-007" are not). Such a
  number fails with `leading zero at <pos>`, `<pos>` the position of that 0.

Preserve (the hidden oracle checks these on untouched inputs):

- Only the digits before the "." are affected: zeros after the "." and in the
  exponent ("1.05", "2e007") are fine.
- Problems are reported in reading order, left to right: the first problem in
  the array wins, and inside one number a leading zero is met before anything
  that follows its whole digits.
- Existing errors keep their text, and valid arrays read the same.
