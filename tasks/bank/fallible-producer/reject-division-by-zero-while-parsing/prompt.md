Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Dividing by zero is an error: `eval` must fail with
  `division by zero at <pos>`, where `<pos>` is the position of the `/`
  (for example `eval("7 / 0", [:])` is `err("division by zero at 2")`).
  What counts is the VALUE of the divisor, however it is written
  (a literal, a variable, a parenthesised expression, `00`, ...).
- Zero stays valid everywhere else (as a dividend, a factor, a term).

Preserve (the hidden oracle checks these on untouched inputs):

- Every existing error message stays byte-identical (`unexpected end of input`,
  `unexpected <tok> at <pos>`, `expected ) at <pos>`, `unknown variable <name> at <pos>`,
  `bad char <c> at <pos>`).
- Errors keep their left-to-right order: the divisor is parsed first, so an
  error inside the divisor wins over the division error; a division by zero is
  reported as soon as the divisor has been parsed, so a syntax error LATER in the
  input (a stray `)`, a missing `)`) does not hide it.
- Integer division keeps its current rounding (`10 / -3` is `-3`).
- Errors propagate explicitly (`!`).
