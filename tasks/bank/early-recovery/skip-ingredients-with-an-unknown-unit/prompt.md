Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- An ingredient line whose unit is not a known unit is no longer fatal:
  `parse_book` skips that line and appends the warning
  `<recipe>: skipped <line> (unknown unit <unit>)`
  (for example `Rice: skipped - 2 cups rice (unknown unit cups)`).
- `parse_ingredient` itself is unchanged and still returns its error.

Preserve (the hidden oracle checks these on untouched inputs):

- Every other error still propagates with its exact text: `bad quantity in: <line>`,
  `short ingredient: <line>`, `bad servings in: <header>`, `bad header: <header>`,
  `ingredient outside recipe: <line>`, `empty recipe <name>`.
- Within one ingredient line the checks keep their order (field count, then
  quantity, then unit): a line with a bad quantity AND an unknown unit is a
  fatal bad quantity.
- A recipe left with no ingredients after skipping is an `empty recipe <name>`.
- Skipping a line keeps the other ingredients of that recipe and every later
  recipe. Warnings are in order: a recipe's skipped-line warnings (in line
  order) come before its "servings missing" warning, recipe by recipe.
