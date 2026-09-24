Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A division by zero is no longer fatal: the division still takes its two
  values off the stack, pushes 0 in their place, and `eval` adds the warning
  `token <i>: division by zero, using 0`.
- `step` is unchanged: it still returns `DivZero(i)`.

Preserve (the hidden oracle checks these on untouched inputs):

- The rest of the program runs on the stack as the division left it (the two
  values gone, 0 on top), so later tokens see exactly one value in their place.
- `Underflow` and `BadToken` stay fatal with their payloads, including an
  underflow that only happens because of what a division consumed.
- Warnings come in token order, and the existing "values left over" warning
  comes after them.
