# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  let stack = list.new[String]()
  for c in string.chars(s)
    match c {
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => if list.is_empty(stack) then false else list.pop_end(stack),
      ']' => if list.is_empty(stack) then false else list.pop_end(stack),
      '}' => if list.is_empty(stack) then false else list.pop_end(stack),
      _   => (),
    }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: 'for' cannot appear at the top level at line 3:3
  --> /tmp/dojo-balanced-parens-0.almd:3:3
  hint: Almide has no top-level loops. Define a function with 'fn' or 'effect fn'.
  |
3 |   for c in string.chars(s)
  |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  let stack = []
  for c in string.chars(s)
    match c {
      '(' => stack = stack + [")"],
      '[' => stack = stack + ["]"],
      '{' => stack = stack + ["}"],
      ')' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      ']' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      '}' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      _   => (),
    }
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: 'for' cannot appear at the top level at line 3:3
  --> /tmp/dojo-balanced-parens-1.almd:3:3
  hint: Almide has no top-level loops. Define a function with 'fn' or 'effect fn'.
  |
3 |   for c in string.chars(s)
  |   ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  let stack = []
  fn iterate_char(c: String) {
    match c {
      '(' => stack = stack + [")"],
      '[' => stack = stack + ["]"],
      '{' => stack = stack + ["}"],
      ')' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      ']' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      '}' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      _   => (),
    }
  }
  for c in string.chars(s) {
    iterate_char(c)
  }
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected Arrow at line 3:30 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:3:30
  |
3 |   fn iterate_char(c: String) {
  |                              ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  let stack = []
  fn iterate_char(c: String) {
    match c {
      '(' => stack = stack + [")"],
      '[' => stack = stack + ["]"],
      '{' => stack = stack + ["}"],
      ')' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      ']' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      '}' => if list.is_empty(stack) then false else stack = list.drop_end(stack, 1),
      _   => (),
    }
  }
  for c in string.chars(s) {
    iterate_char(c)
  }
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected Arrow at line 3:30 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:3:30
  |
3 |   fn iterate_char(c: String) {
  |                              ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
