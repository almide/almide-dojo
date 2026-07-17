# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  = list.fold(string.chars(s), list.new(), (stack, c) =>
    match c {
      '(' | '[' | '{' => list.push(stack, c),
      ')' | ']' | '}' =>
        if list.is_empty(stack) then false
        else match list.last(stack) {
          '(' => if c != ')' then false else list.drop_end(stack, 1),
          '[' => if c != ']' then false else list.drop_end(stack, 1),
          '{' => if c != '}' then false else list.drop_end(stack, 1),
          _ => false
        },
      _ => stack
    }) == list.new()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-0.almd:2:3
  |
2 |   = list.fold(string.chars(s), list.new(), (stack, c) =>
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
  = fn stack =>
    list.fold(string.chars(s), stack, (acc, c) =>
      match c {
        '(' | '[' | '{' => list.push(acc, c),
        ')' | ']' | '}' =>
          if list.is_empty(acc) then false
          else match list.last(acc) {
            '(' => if c != ')' then false else list.drop_end(acc, 1),
            '[' => if c != ']' then false else list.drop_end(acc, 1),
            '{' => if c != '}' then false else list.drop_end(acc, 1),
            _ => false
          },
        _ => acc
      }) == list.new()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-1.almd:2:3
  |
2 |   = fn stack =>
  |   ^
error: Expected LParen at line 2:14 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-1.almd:2:14
  |
2 |   = fn stack =>
  |              ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  = fn stack =>
    let result =
      list.fold(string.chars(s), stack, (acc, c) =>
        match c {
          '(' | '[' | '{' => list.push(acc, c),
          ')' | ']' | '}' =>
            if list.is_empty(acc) then false
            else match list.last(acc) {
              '(' => if c != ')' then false else list.drop_end(acc, 1),
              '[' => if c != ']' then false else list.drop_end(acc, 1),
              '{' => if c != '}' then false else list.drop_end(acc, 1),
              _ => false
            },
          _ => acc
        })
    in result == list.new()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-2.almd:2:3
  |
2 |   = fn stack =>
  |   ^
error: Expected LParen at line 2:14 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-2.almd:2:14
  |
2 |   = fn stack =>
  |              ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool
  = fn stack =>
    let result =
      list.fold(string.chars(s), stack, (acc, c) =>
        match c {
          '(' | '[' | '{' => list.push(acc, c),
          ')' | ']' | '}' =>
            if list.is_empty(acc) then false
            else match list.last(acc) {
              '(' => if c != ')' then false else list.drop_end(acc, 1),
              '[' => if c != ']' then false else list.drop_end(acc, 1),
              '{' => if c != '}' then false else list.drop_end(acc, 1),
              _ => false
            },
          _ => acc
        })
    in result == list.new()

fn is_balanced(s: String) -> Bool
  = fn stack =>
    let stack = list.new()
    let result =
      list.fold(string.chars(s), stack, (acc, c) =>
        match c {
          '(' | '[' | '{' => list.push(acc, c),
          ')' | ']' | '}' =>
            if list.is_empty(acc) then false
            else match list.last(acc) {
              '(' => if c != ')' then false else list
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-3.almd:2:3
  |
2 |   = fn stack =>
  |   ^
error: Expected LParen at line 2:14 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-3.almd:2:14
  |
2 |   = fn stack =>
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:3 (got Eq '=')
  --> /tmp/dojo-balanced-parens-3.almd:20:3
   |
20 |   = fn stack =>
   |   ^
error: Expected LParen at line 20:14 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-3.almd:20:14
   |
20 |   = fn stack =>
   |              ^
error[E012]: duplicate function 'is_balanced'
  at line 19
  in fn is_balanced
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool
   | -------------------------------------- first definition of 'is_balanced' here
...
19 | fn is_balanced(s: String) -> Bool
   | ^^^^^^^^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
