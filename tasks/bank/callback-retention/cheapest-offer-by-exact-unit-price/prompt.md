Modify the program below. Return the whole file.

Requested change:

- Add `fn best_offer(offers: List[String]) -> (String) -> String` returning a
  closure that, given a product name, answers `<product>: <offer>` for the
  offer with the lowest price PER UNIT (the offer text as written), or
  `<product>: no offers`. Ties go to the earlier offer.

Preserve (the hidden oracle checks these):

- `parse_offer` and `valid_offers` keep their exact behaviour.
- Unit prices are compared EXACTLY as fractions (83/1 is less than 250/3):
  compare c1 * u2 with c2 * u1, never rounded per-unit prices.
- The closure captures only the chosen offer text, never `offers`.
