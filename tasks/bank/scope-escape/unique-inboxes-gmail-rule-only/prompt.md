Modify the program below. Return the whole file.

Requested change:

- Add `fn inboxes(es: List[String]) -> String` returning `unique=<n>,invalid=<m>`:
  how many distinct mailboxes the valid addresses reach, and how many
  addresses are invalid.

Preserve (the hidden oracle checks these):

- `split_email`, `valid_count` and `domains` keep their exact behaviour.
- The dot and "+tag" rules apply to gmail.com ONLY: "a.b@x.org" and
  "ab@x.org" are two mailboxes; "a.b+news@gmail.com" and "ab@gmail.com" are
  one. The local part is otherwise case-sensitive; the domain is not.
- The canonical-address set is a temporary of `inboxes`: return only the string.
