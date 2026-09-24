Modify the program below. Return the whole file.

Requested change:

- Add `fn eligible(catalog: Map[String, List[String]], transcripts: List[String]) -> List[String]`
  returning, for each student in order, the catalogue courses (in catalogue
  order) the student has NOT passed yet but may take, joined by `,`.

Preserve (the hidden oracle checks these):

- `passed`, `prerequisites` and `has_passed` keep their exact behaviour.
- A course may be taken only when EVERY one of its prerequisites is passed; a
  course without prerequisites is always open.
- `catalog` is shared outer data; each student's passed list is a temporary
  of that student's step.
