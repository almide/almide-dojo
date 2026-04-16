# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  let pairs = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  let open_brackets = list.map(pairs |> map.keys, (x) => x)
  let close_brackets = list.map(pairs |> map.values, (x) => x)
  in list.fold(string.chars(s), true, (acc, ch) => 
    if list.contains(open_brackets, ch) 
    then stack |> list.push(ch) |> (x) => acc 
    else if list.contains(close_brackets, ch) 
    then if stack |> list.is_empty 
    then false 
    else let top = stack |> list.last 
    in if top |> option.is_none 
    then false 
    else let top_val = top |> option.unwrap_or("")
    in if map.get(pairs, top_val) |> option.unwrap_or("") == ch 
    then stack |> list.drop_end(1) |> (x) => acc 
    else false 
    else acc 
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:12:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     else let top = stack |> list.last
   |          ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:15:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |     else let top_val = top |> option.unwrap_or("")
   |          ^^^
error: Expected expression at line 19:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:19:5
   |
19 |     else acc
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'top_val'
  --> /tmp/dojo-balanced-parens-0.almd:16:23
  in variable top_val
  hint: Check the variable name
   |
16 |     if map.get(pairs, top_val) |> option.unwrap_or("") == ch
   |                       ^^^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:16:59
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
16 |     if map.get(pairs, top_val) |> option.unwrap_or("") == ch
   |                                                           ^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:17:46
  in variable acc
  hint: Check the variable name
   |
17 |     then stack |> list.drop_end(1) |> (x) => acc
   |                                              ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:18:10
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |     else false
   |          ^^^^^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.chars(s), (true, []), (acc, ch) => 
    if list.contains(["(", "[", "{"] , ch) 
    then (acc.0, acc.1 + [ch]) 
    else if list.contains([")", "]", "}"] , ch) 
    then if acc.1 |> list.is_empty 
    then (false, []) 
    else let top = acc.1 |> list.last 
    in if top |> option.is_none 
    then (false, []) 
    else let top_val = top |> option.unwrap_or("") 
    in if (top_val == "(" && ch == ")") || (top_val == "[" && ch == "]") || (top_val == "{" && ch == "}") 
    then (acc.0, acc.1 |> list.drop_end(1)) 
    else (false, []) 
    else (acc.0, acc.1)) 
  |> (x) => x.0
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:8:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     else let top = acc.1 |> list.last
  |          ^^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.chars(s), (true, []), (acc, ch) => 
    if list.contains(["(", "[", "{"] , ch) 
    then (acc.0, acc.1 + [ch]) 
    else if list.contains([")", "]", "}"] , ch) 
    then if acc.1 |> list.is_empty 
    then (false, []) 
    else 
      let top = acc.1 |> list.last in
      if top |> option.is_none 
      then (false, []) 
      else 
        let top_val = top |> option.unwrap_or("") in
        if (top_val == "(" && ch == ")") || (top_val == "[" && ch == "]") || (top_val == "{" && ch == "}") 
        then (acc.0, acc.1 |> list.drop_end(1)) 
        else (false, []) 
    else (acc.0, acc.1)) 
  |> (x) => x.0
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:9:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let top = acc.1 |> list.last in
  |       ^^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.chars(s), (true, []), (acc, ch) => 
    if list.contains(["(", "[", "{"] , ch) 
    then (acc.0, acc.1 + [ch]) 
    else if list.contains([")", "]", "}"] , ch) 
    then if acc.1 |> list.is_empty 
    then (false, []) 
    else 
      {
        let top = acc.1 |> list.last in
        let top_val = top |> option.unwrap_or("") in
        if (top_val == "(" && ch == ")") || (top_val == "[" && ch == "]") || (top_val == "{" && ch == "}") 
        then (acc.0, acc.1 |> list.drop_end(1)) 
        else (false, [])
      } 
    else (acc.0, acc.1)) 
  |> (x) => x.0
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: '&&' is not valid in Almide at line 12:28
  --> /tmp/dojo-balanced-parens-3.almd:12:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
12 |         if (top_val == "(" && ch == ")") || (top_val == "[" && ch == "]") || (top_val == "{" && ch == "}")
   |                            ^
error[E001]: type mismatch in if branches: expected (Bool, List[?4]) but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:11:47
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce (Bool, List[?4]). Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: (Bool, List[?4])) -> (Bool, List[?4]) = if cond then step(<update>) else x
   |
11 |         let top_val = top |> option.unwrap_or("")
   |                                               ^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
