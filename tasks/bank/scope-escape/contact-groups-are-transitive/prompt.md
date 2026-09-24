Modify the program below. Return the whole file.

Requested change:

- Add `fn people(es: List[Entry]) -> String` returning `people=<n>`: how many
  distinct persons the entries describe.

Preserve (the hidden oracle checks these):

- `shares` and `email_count` keep their exact behaviour.
- Grouping is TRANSITIVE: entries linked only through a third entry are the
  same person, whatever order the entries come in. An entry without emails
  is its own person.
- The grouping is a temporary of `people`: return only the string.
