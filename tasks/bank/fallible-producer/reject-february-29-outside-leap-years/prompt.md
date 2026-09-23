Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- February 29 exists only in leap years. For a date `YYYY-02-29` in a year that
  is not a leap year, `parse_date` must fail with `not a leap year: <date>`
  (for example `not a leap year: 2023-02-29`). Leap years are the Gregorian
  ones: divisible by 4, except years divisible by 100 that are not divisible by 400.

Preserve (the hidden oracle checks these on untouched inputs):

- Every existing error message stays byte-identical; in particular February 30
  and 31 are still `day out of range: <date>` in every year.
- February 29 of a leap year (2024, 2000, ...) stays valid, and night counts
  are unchanged.
- The checks of one date keep their order (shape, year, month, day digits,
  month range, day range), with the leap-year check after the day range; the
  check-in date is parsed before the check-out date, and across the list the
  first failing stay wins.
- Errors propagate explicitly (`!`).
