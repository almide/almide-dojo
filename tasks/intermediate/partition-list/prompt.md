Write a function with this exact signature:

    fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int])

Behavior:

- Split `xs` into two lists: elements that satisfy `predicate` and elements that don't
- Return a tuple `(matching, non_matching)`
- Preserve the order of elements within each group
- `partition([1, 2, 3, 4, 5], (x) => x % 2 == 0)` returns `([2, 4], [1, 3, 5])`

Notes:

- You may use `list.partition(xs, pred)` from the stdlib, or implement it with `list.fold`.
- Tuples are written as `(a, b)` in Almide.
