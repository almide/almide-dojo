Implement basic matrix operations using nested lists.

A matrix is represented as `List[List[Int]]` where each inner list is a row.

Write functions with these exact signatures:

    fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]]
    fn mat_transpose(m: List[List[Int]]) -> List[List[Int]]
    fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]]
    fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int

Behavior:

**`mat_add`**: Element-wise addition of two matrices of the same dimensions.
- `mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]])` returns `[[6, 8], [10, 12]]`

**`mat_transpose`**: Transpose rows and columns.
- `mat_transpose([[1, 2, 3], [4, 5, 6]])` returns `[[1, 4], [2, 5], [3, 6]]`
- `mat_transpose([[]])` returns `[]`
- `mat_transpose([])` returns `[]`

**`mat_scale`**: Multiply every element by scalar `s`.
- `mat_scale([[1, 2], [3, 4]], 3)` returns `[[3, 6], [9, 12]]`

**`mat_dot_row`**: Dot product of two vectors (used as helper for multiplication).
- `mat_dot_row([1, 2, 3], [4, 5, 6])` returns `32`

Notes:

- Use `list.map` and nested `list.map` for element-wise operations.
- For transpose, use `list.range(0, ncols)` to iterate column indices.
- Use `list.get(xs, i) |> option.unwrap_or(0)` for indexed access.
