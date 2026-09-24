Modify the program below. Return the whole file.

Requested change:

- Add `fn compact(spec: List[Int]) -> String` returning the pages as sorted
  ranges: consecutive pages as `a-b`, single pages alone, joined by `,`
  ("1-3,5,7-8").

Preserve (the hidden oracle checks these):

- `pages` and `in_list` keep their exact behaviour.
- A repeated page is printed once and does not break a range: [1, 2, 2, 3]
  is "1-3".
- The sorted list is a temporary of `compact`: return only the string.
