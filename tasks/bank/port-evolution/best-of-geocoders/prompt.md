Modify the program below. Return the whole file.

Requested change:

- Add a composite `type BestOf: Geocoder = { first: Gazetteer, second: Gazetteer, min_conf: Int }`
  that asks BOTH gazetteers, ignores any hit whose confidence is below `min_conf`, and
  answers the remaining hit with the higher confidence (`none` when neither remains).
- Add `type Source = | One(Gazetteer) | Both(BestOf)` and
  `fn resolve_with(s: Source, queries: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Gazetteer`, `resolve` and the protocol keep their behaviour.
- It is the BEST hit, not the first acceptable one: a more confident answer from
  `second` beats an acceptable answer from `first`.
- On equal confidence `first` wins. `min_conf` is inclusive (a hit exactly at it counts).
- A low-confidence hit is not an answer: when both hits are below `min_conf`, or one is
  below and the other missing, the query resolves to `?`.
