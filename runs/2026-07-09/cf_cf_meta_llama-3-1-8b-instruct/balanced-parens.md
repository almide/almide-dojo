# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  = let
    stack = list.new()
    in
    list.fold(string.chars(s), None, (acc, c) =>
      match c {
        some('(') => list.push(stack, "("),
        some(')') => match list.last(stack) {
          some('(') => list.drop_end(stack, 1),
          _ => return false
        },
        some('[') => list.push(stack, "["),
        some(']') => match list.last(stack) {
          some('[') => list.drop_end(stack, 1),
          _ => return false
        },
        some('{') => list.push(stack, "{"),
        some('}') => match list.last(stack) {
          some('{') => list.drop_end(stack, 1),
          _ => return false
        },
        _ => ()
      };
      list.is_empty(stack)
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-0.almd:2:3
  |
2 |   = let
  |   ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  = let
    stack = list.new()
    in
    list.fold(string.chars(s), None, (acc, c) =>
      match c {
        some('(') => list.push(stack, "("),
        some(')') => match list.last(stack) {
          some('(') => list.drop_end(stack, 1),
          _ => return false
        },
        some('[') => list.push(stack, "["),
        some(']') => match list.last(stack) {
          some('[') => list.drop_end(stack, 1),
          _ => return false
        },
        some('{') => list.push(stack, "{"),
        some('}') => match list.last(stack) {
          some('{') => list.drop_end(stack, 1),
          _ => return false
        },
        _ => ()
      };
      list.is_empty(stack)
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-1.almd:2:3
  |
2 |   = let
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
  = let
    stack = list.new()
    in
    list.fold(string.chars(s), None, (acc, c) =>
      match c {
        some('(') => list.push(stack, "("),
        some(')') => match list.last(stack) {
          some('(') => list.drop_end(stack, 1),
          _ => return false
        },
        some('[') => list.push(stack, "["),
        some(']') => match list.last(stack) {
          some('[') => list.drop_end(stack, 1),
          _ => return false
        },
        some('{') => list.push(stack, "{"),
        some('}') => match list.last(stack) {
          some('{') => list.drop_end(stack, 1),
          _ => return false
        },
        _ => ()
      };
      list.is_empty(stack)
    )

fn is_balanced(s: String) -> Bool
  = let
    stack = list.new()
    in
    list.fold(string.chars(s), None, (acc, c) =>
      match c {
        some('(') => list.push(stack, "("),
        some(')') => match list.last(stack) {
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-2.almd:2:3
  |
2 |   = let
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-2.almd:28:3
   |
28 |   = let
   |   ^
error[E012]: duplicate function 'is_balanced'
  at line 27
  in fn is_balanced
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool
   | -------------------------------------- first definition of 'is_balanced' here
...
27 | fn is_balanced(s: String) -> Bool
   | ^^^^^^^^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  = let
    stack = list.new()
    in
    list.fold(string.chars(s), None, (acc, c) =>
      match c {
        some('(') => list.push(stack, "("),
        some(')') => match list.last(stack) {
          some('(') => list.drop_end(stack, 1),
          _ => return false
        },
        some('[') => list.push(stack, "["),
        some(']') => match list.last(stack) {
          some('[') => list.drop_end(stack, 1),
          _ => return false
        },
        some('{') => list.push(stack, "{"),
        some('}') => match list.last(stack) {
          some('{') => list.drop_end(stack, 1),
          _ => return false
        },
        _ => ()
      };
      list.is_empty(stack))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-3.almd:2:3
  |
2 |   = let
  |   ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
