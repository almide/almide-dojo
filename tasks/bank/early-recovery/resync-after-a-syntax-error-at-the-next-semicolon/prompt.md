Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A `Syntax` error in a statement is no longer fatal: `run` records
  `syntax error at token <i>: <message>` in `errors`, then resumes just after
  the first `;` token at or after the error's position <i>. If no `;` is left,
  the run ends there. The failing statement has no effect.

Preserve (the hidden oracle checks these on untouched inputs):

- The search for `;` starts AT the error position: an error found on the `;`
  itself (like `let a = 2 * ;`) resumes right after that `;`, and the next
  statement still runs.
- A failed `let` defines nothing, so a later use of that name is `Unbound`.
- `BadChar` (lexer) and `Unbound` stay fatal with their payloads.
- `errors` keeps the order in which the errors were found; `printed` is unchanged
  for valid scripts.
