Write a function with this exact signature:

    fn max_of_list(xs: List[Int]) -> Option[Int]

Behavior:

- Return `some(max)` where `max` is the largest element in `xs`
- Return `none` if `xs` is empty

Notes:

- Use `list.is_empty(xs)` to check for an empty list.
- You may use `list.fold`, `list.reduce`, or recursion.
- Wrap results with `some(value)` and `none`.
