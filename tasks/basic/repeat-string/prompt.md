Write a function with this exact signature:

    fn repeat(s: String, n: Int) -> String

Behavior:

- Return `s` concatenated with itself `n` times
- `repeat("ab", 3)` must return `"ababab"`
- `repeat("x", 0)` must return `""`
- `repeat("", 5)` must return `""`
- Assume `n >= 0`

Notes:

- You may use `string.repeat(s, n)` from the stdlib, or implement it with recursion.
