Modify the program below. Return the whole file.

Requested change:

- Add `fn adults(ps: List[Person], today: String) -> String` returning
  `adults=<n>,minors=<m>` where an adult is 18 or older on `today`.

Preserve (the hidden oracle checks these):

- `ymd` and `born_in` keep their exact behaviour.
- Age is in completed years: someone born 2008-10-05 is 17 on 2026-10-04 and
  18 on 2026-10-05 (the birthday itself counts).
- The computed ages are a temporary of `adults`: return only the string.
