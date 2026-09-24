Modify the program below. Return the whole file.

Requested change:

- Add `fn resolve_all(defaults: Map[String, String], services: List[String], key: String) -> List[String]`
  returning, for each service's override text in order, the resolved value of
  `key`, or `unset` when neither the defaults nor that service define it.

Preserve (the hidden oracle checks these):

- `overrides` and `apply` keep their exact behaviour.
- Every service starts from the SAME defaults: one service's overrides never
  leak into the next service.
- `defaults` is shared outer data; each service's resolved map is a
  temporary of that service's step.
