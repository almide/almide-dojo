Modify the program below. Return the whole file.

Requested change:

- Add `fn allergens(table: Map[String, String], recipes: List[String]) -> List[String]`
  returning, for each recipe in order, the allergens of its ingredients
  (looked up in `table`), without repeats, in order of first appearance,
  joined by `,`.

Preserve (the hidden oracle checks these):

- `ingredient` and `ingredients` keep their exact behaviour: "2 eggs" is the
  ingredient "eggs"; a line without a leading quantity is used whole.
- Ingredients missing from `table` have no allergen.
- `table` is shared outer data; each recipe's ingredient list is a temporary
  of that recipe's step.
