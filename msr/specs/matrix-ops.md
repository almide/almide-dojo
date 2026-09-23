A matrix is a list of rows; each row is a list of integers.

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
