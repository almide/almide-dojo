Write a function with this exact signature:

    fn flatten(xss: List[List[Int]]) -> List[Int]

Behavior:

- Flatten a list of lists into a single list
- `flatten([[1, 2], [3], [4, 5]])` must return `[1, 2, 3, 4, 5]`
- `flatten([])` must return `[]`
- `flatten([[], [], []])` must return `[]`
- Preserve the order of elements

Notes:

- You may use `list.flatten(xss)` from the stdlib, or implement it with `list.fold`.
