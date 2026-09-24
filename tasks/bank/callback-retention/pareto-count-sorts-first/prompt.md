Modify the program below. Return the whole file.

Requested change:

- Add `fn pareto(lines: List[(String, Int)]) -> (String) -> String` returning a
  closure that, given a report title, answers
  `<title>: <k> of <n> lines make 80%`: the SMALLEST number of product lines
  whose revenue together reaches at least 80% of the total.

Preserve (the hidden oracle checks these):

- `total` and `biggest` keep their exact behaviour.
- The smallest number: take the biggest lines first (catalogue order is
  irrelevant). "At least 80%" is exact: sum * 100 >= total * 80. With a total
  of 0 or no lines, k is 0.
- The closure captures only the two counts, never `lines`.
