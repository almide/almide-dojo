Modify the program below. Return the whole file.

Requested change:

- Add `fn busiest(xs: List[Int], w: Int) -> String` returning
  `<label> x<count>` for the bucket holding the most values (for example
  `[10,20) x3`), or `empty` when `xs` is empty.

Preserve (the hidden oracle checks these):

- `bucket_of`, `label`, `counts` and `histogram` keep their exact behaviour;
  negative values still fall in negative buckets.
- When several buckets tie for the most values, report the LOWEST bucket
  (numerically), whatever order the values arrived in.
- The bucket counts are a temporary of `busiest`: return only the string.
