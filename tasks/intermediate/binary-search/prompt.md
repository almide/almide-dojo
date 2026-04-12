Write a function with this exact signature:

    fn binary_search(xs: List[Int], target: Int) -> Option[Int]

Behavior:

- Search for `target` in a **sorted** list `xs`
- Return `some(index)` if found, `none` if not found
- If `target` appears multiple times, return the index of any occurrence
- `binary_search([], 5)` returns `none`

Notes:

- Implement iterative or recursive binary search.
- Use `list.get(xs, i)` which returns `Option[Int]`.
- Use `option.unwrap_or(opt, default)` to safely unwrap.
- Use `list.len(xs)` to get the list length.
