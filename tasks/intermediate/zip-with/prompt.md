Write a function with this exact signature:

    fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int]

Behavior:

- Combine two lists element-wise using function `f`
- Stop at the shorter list's length
- `zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b)` returns `[11, 22, 33]`
- `zip_with([1, 2], [10, 20, 30], (a, b) => a * b)` returns `[10, 40]`
- `zip_with([], [1, 2], (a, b) => a + b)` returns `[]`

Notes:

- You can use `list.zip(xs, ys)` to pair elements, then `list.map` with `f` applied to each pair.
- Or implement it recursively with `list.get` and index tracking.
