# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
    let stack = list.new[String]()
    let bracket_pairs = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    for (ch) in string.chars(s) {
        if list.contains(["(", "[", "{"], ch) then
            stack = stack + [ch]
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(stack) || list.last(stack) != some(map.get(bracket_pairs, ch)) then
                false
            else
                stack = list.drop_end(stack, 1)
        else
            ()
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
    let bracket_pairs = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let result = list.fold(string.chars(s), true, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            acc
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(stack) || list.last(stack) != some(map.get(bracket_pairs, ch)) then
                false
            else
                acc
        else
            acc
    )
    let final_stack = list.fold(string.chars(s), stack, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            acc + [ch]
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(acc) || list.last(acc) != some(map.get(bracket_pairs, ch)) then
                acc
            else
                list.drop_end(acc, 1)
        else
            acc
    )
    result && list.is_empty(final_stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 12:37
  --> /tmp/dojo-balanced-parens-1.almd:12:37
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |             if list.is_empty(stack) || list.last(stack) != some(map.get(bracket_pairs, ch)) then
   |                                     ^
error: Expected expression at line 16:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:16:9
   |
16 |         else
   |         ^
error: Expected expression at line 18:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-1.almd:18:5
   |
18 |     )
   |     ^
error: '||' is not valid in Almide at line 23:35
  --> /tmp/dojo-balanced-parens-1.almd:23:35
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
23 |             if list.is_empty(acc) || list.last(acc) != some(map.get(bracket_pairs, ch)) then
   |                                   ^
error: Expected expression at line 25:13 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:25:13
   |
25 |             else
   |             ^
error: Expected expression at line 27:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:27:9
   |
27 |         else
   |         ^
error: Expected expression at line 29:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-1.almd:29:5
   |
29 |     )
   |     ^
error: '&&' is not valid in Almide at line 30:12
  --> /tmp/dojo-balanced-parens-1.almd:30:12
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
30 |     result && list.is_empty(final_stack)
   |            ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |     let stack = list.new[String]()
  |                         ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:15:17
  in variable acc
  hint: Check the variable name
   |
15 |                 acc
   |                 ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:17:13
  in variable acc
  hint: Check the variable name
   |
17 |             acc
   |             ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:24:17
  in variable acc
  hint: Check the variable name
   |
24 |                 acc
   |                 ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:26:31
  in variable acc
  hint: Check the variable name
   |
26 |                 list.drop_end(acc, 1)
   |                               ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:28:13
  in variable acc
  hint: Check the variable name
   |
28 |             acc
   |             ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:28:13
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
28 |             acc
   |             ^^^

15 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_pairs = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let result = list.fold(string.chars(s), true, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            acc and true
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(stack) or list.last(stack) != some(map.get(bracket_pairs, ch)) then
                false
            else
                acc and true
        else
            acc and true
    )
    let final_stack = list.fold(string.chars(s), stack, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            acc + [ch]
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(acc) or list.last(acc) != some(map.get(bracket_pairs, ch)) then
                acc
            else
                list.drop_end(acc, 1)
        else
            acc
    )
    result and list.is_empty(final_stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E005]: argument 'f' expects fn(List[Option[String]], String) -> List[Option[String]] but got fn(List[String], String) -> List[String]
  --> /tmp/dojo-balanced-parens-2.almd:28:13
  in call to list.fold()
  hint: Fix the argument type
   |
28 |             acc
   |             ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(List[Option[String]], String) -> List[Option[String]] but got fn(List[String], String) -> List[String]
  --> /tmp/dojo-balanced-parens-2.almd:28:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
28 |             acc
   |             ^^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let stack = []
    let bracket_pairs = map.from_list([
        (")", "("),
        ("]", "["),
        ("}", "{")
    ])
    let result = list.fold(string.chars(s), true, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            acc and true
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(stack) or list.last(stack) != some(map.get(bracket_pairs, ch)) then
                false
            else
                acc and true
        else
            acc and true
    )
    let final_stack = list.fold(string.chars(s), stack, (acc, ch) => 
        if list.contains(["(", "[", "{"], ch) then
            acc + [ch]
        else if map.contains(bracket_pairs, ch) then
            if list.is_empty(acc) or list.last(acc) != some(map.get(bracket_pairs, ch)) then
                acc
            else
                list.drop_end(acc, 1)
        else
            acc
    )
    result and list.is_empty(final_stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error[E005]: argument 'f' expects fn(List[Option[String]], String) -> List[Option[String]] but got fn(List[String], String) -> List[String]
  --> /tmp/dojo-balanced-parens-3.almd:28:13
  in call to list.fold()
  hint: Fix the argument type
   |
28 |             acc
   |             ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(List[Option[String]], String) -> List[Option[String]] but got fn(List[String], String) -> List[String]
  --> /tmp/dojo-balanced-parens-3.almd:28:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
28 |             acc
   |             ^^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
