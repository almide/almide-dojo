Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A worker needs at least 11 hours of rest between the end of one shift and the
  start of their next shift. `roster` (and so `hours`) must fail with
  `<worker> needs 11h rest before <day HH:MM> (had <h>h<mm>)` for the first
  shift, in time order, that starts too soon (for example
  `ann needs 11h rest before tue 06:00 (had 7h00)`).

Preserve (the hidden oracle checks these on untouched inputs):

- "Next shift" is in TIME order within the week: lines may list shifts in any
  order. Rest counts across midnight and across days. Exactly 11h00 is enough;
  other workers' shifts do not matter.
- Every line is parsed first with its existing checks (first bad line wins);
  rest is checked after all lines are read. When several shifts break the rule,
  report the one that starts earliest.
- `hours` output is unchanged.
