Write a function with this exact signature:

    fn remove_duplicates(xs: List[Int]) -> List[Int]

Behavior:

- Return a new list with duplicate elements removed
- Preserve the order of first occurrence
- `remove_duplicates([])` must return `[]`
- `remove_duplicates([1, 2, 2, 3, 1])` must return `[1, 2, 3]`

Notes:

- You may use `list.unique(xs)` from the stdlib, or implement it manually.
