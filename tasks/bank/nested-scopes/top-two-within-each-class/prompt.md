Modify the program below. Return the whole file.

Requested change:

- Add `fn podiums(classes: List[String]) -> List[String]` returning, for each
  class in order, its two best students joined by `,` (fewer if the class is
  smaller), highest score first, ties by name.

Preserve (the hidden oracle checks these):

- `entries`, `class_size` and `best_score` keep their exact behaviour.
- The top two are chosen WITHIN each class, never across the whole school;
  students with equal scores are ordered by name.
- Each class's ranking is a temporary of that class's step.
