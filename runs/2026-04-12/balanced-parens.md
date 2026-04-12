# balanced-parens

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn is_balanced(s: String) -> Bool =
  let chars = string.chars(s)
  let final_stack = list.fold(chars, [], (stack, c) =>
    match c {
      "(" => stack + ["("],
      "[" => stack + ["["],
      "{" => stack + ["{"],
      ")" => if list.last(stack) == some("(") then list.drop_end(stack, 1) else stack + ["!"],
      "]" => if list.last(stack) == some("[") then list.drop_end(stack, 1) else stack + ["!"],
      "}" => if list.last(stack) == some("{") then list.drop_end(stack, 1) else stack + ["!"],
      _ => stack,
    }
  )
  final_stack == []
```
