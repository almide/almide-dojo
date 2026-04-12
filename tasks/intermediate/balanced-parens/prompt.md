Write a function with this exact signature:

    fn is_balanced(s: String) -> Bool

Behavior:

- Return `true` if every opening bracket in `s` has a matching closing bracket in the correct order
- Support three bracket types: `()`, `[]`, `{}`
- Non-bracket characters are ignored
- `is_balanced("")` returns `true`
- `is_balanced("([{}])")` returns `true`
- `is_balanced("([)]")` returns `false`

Notes:

- A stack-based approach works: push opening brackets, pop on closing brackets.
- You can use a `List[String]` as a stack with `list.push` / `list.last` / `list.drop_end`.
- Use `string.chars(s)` to iterate.
