# balanced-parens

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let result = list.fold(string.chars(s), some([]), (acc, c) =>
    match acc {
      none => none,
      some(stack) =>
        if c == "(" || c == "[" || c == "{" then
          some(stack + [c])
        else if c == ")" || c == "]" || c == "}" then
          match list.last(stack) {
            none => none,
            some(top) =>
              if (c == ")" && top == "(") || (c == "]" && top == "[") || (c == "}" && top == "{") then
                some(list.drop_end(stack, 1))
              else
                none
          }
        else
          some(stack)
    })
  match result {
    none => false,
    some(stack) => list.is_empty(stack)
  }
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd
error: '||' is not valid in Almide at line 6:21
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd:6:21
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |         if c == "(" || c == "[" || c == "{" then
  |                     ^
error: '&&' is not valid in Almide at line 12:28
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd:12:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
12 |               if (c == ")" && top == "(") || (c == "]" && top == "[") || (c == "}" && top == "{") then
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:11 (got RBrace '}')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd:16:11
   |
16 |           }
   |           ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd:2:3
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let result = list.fold(string.chars(s), some([]), (acc, c) =>
  |   ^^^

4 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_balanced(s: String) -> Bool =
  let result = list.fold(string.chars(s), some([]), (acc, c) =>
    match acc {
      none => none,
      some(stack) =>
        if c == "(" or c == "[" or c == "{" then
          some(stack + [c])
        else if c == ")" or c == "]" or c == "}" then
          match list.last(stack) {
            none => none,
            some(top) =>
              if (c == ")" and top == "(") or (c == "]" and top == "[") or (c == "}" and top == "{") then
                some(list.drop_end(stack, 1))
              else
                none
          }
        else
          some(stack)
    })
  match result {
    none => false,
    some(stack) => list.is_empty(stack)
  }
```
