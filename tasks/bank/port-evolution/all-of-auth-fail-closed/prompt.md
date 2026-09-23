Modify the program below. Return the whole file.

Requested change:

- Add a composite adapter `type AllOf: Auth = { parts: List[Grants] }` that allows an
  action only when EVERY part allows it.
- Add `type Policy = | Single(Grants) | All(AllOf)` and
  `fn permitted_by(p: Policy, user: String, actions: List[String]) -> List[String]`
  that runs the generic `permitted` with the selected adapter, and
  `fn audit_by(p: Policy, user: String, actions: List[String]) -> String` that does the
  same for `audit`.

Preserve (the hidden oracle checks these):

- `Grants`, `permitted`, `audit` and the protocol keep their exact behaviour: a
  wildcard is only the whole rule `user:*`; `bob:rea` does not grant `read`.
- The composite fails CLOSED: an `AllOf` with no parts allows nothing.
- `permitted` keeps the order of the asked actions and their duplicates.
