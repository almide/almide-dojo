# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
    let stack = list.new[String]()
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    for char in string.chars(s) {
        if list.contains(["(", "[", "{"], char) then
            stack = stack + [char]
        else if list.contains([")", "]", "}"], char) then
            if list.is_empty(stack) || list.last(stack) != map.get(bracket_map, char) then
                false
            else
                stack = list.drop_end(stack, 1)
    }
    list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-balanced-parens-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn is_balanced(...) -> Type = { ... }
  |
1 | fn is_balanced(s: String) -> Bool {
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = list.new[String]()
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    let result = 
        for char in string.chars(s) {
            if list.contains(["(", "[", "{"], char) then
                stack = stack + [char]
            else if list.contains([")", "]", "}"], char) then
                if list.is_empty(stack) || list.last(stack) != map.get_or(bracket_map, char, "") then
                    false
                else
                    stack = list.drop_end(stack, 1)
        }
    if list.is_empty(result) then list.is_empty(stack) else false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 9:41
  --> /tmp/dojo-balanced-parens-1.almd:9:41
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
9 |                 if list.is_empty(stack) || list.last(stack) != map.get_or(bracket_map, char, "") then
  |                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:9 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:13:9
   |
13 |         }
   |         ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |     let stack = list.new[String]()
  |                         ^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:12:50
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |     let stack = list.new[String]()
   |     --------------------- 'stack' declared here
...
12 |                     stack = list.drop_end(stack, 1)
   |                                                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:12:50
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
12 |                     stack = list.drop_end(stack, 1)
   |                                                  ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    var stack = []
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    for char in string.chars(s) {
        if list.contains(["(", "[", "{"], char) then
            stack = stack + [char]
        else if list.contains([")", "]", "}"], char) then
            if list.is_empty(stack) or list.last(stack) != map.get_or(bracket_map, char, "") then
                false
            else
                stack = list.drop_end(stack, 1)
    }
    list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:11:46
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
11 |                 stack = list.drop_end(stack, 1)
   |                                              ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:7:14
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
7 |         else if list.contains([")", "]", "}"], char) then
  |              ^^
error[E001]: type mismatch in if branches: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:7:14
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the then-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
  |
7 |         else if list.contains([")", "]", "}"], char) then
  |              ^^

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    let result = list.fold(string.chars(s), true, (acc, char) => 
        if list.contains(["(", "[", "{"], char) then
            acc
        else if list.contains([")", "]", "}"], char) then
            if list.is_empty(stack) or list.last(stack) != map.get_or(bracket_map, char, "") then
                false
            else
                list.is_empty(list.drop_end(stack, 1))
        else
            acc
    )
    result && list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: '&&' is not valid in Almide at line 15:12
  --> /tmp/dojo-balanced-parens-3.almd:15:12
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
15 |     result && list.is_empty(stack)
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:13:13
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
13 |             acc
   |             ^^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
