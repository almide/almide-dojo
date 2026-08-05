# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-0.almd:3:35
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  |                                   ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-0.almd:3:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  |                                                                ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  // No need to explicitly return the result, the last expression is the value
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-1.almd:3:35
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  |                                   ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-1.almd:3:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  |                                                                ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  // No need to explicitly return the result, the last expression is the value
}

// int.min_value() is not available, use int.min instead
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else list.fold(xs, int.min, (max, x) => int.max(max, x))
}

// or use recursion
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  match xs {
    none => none
    some(x :: xs) => if list.is_empty(xs) then some(x) else list.max(xs, x)
  }
}

// or use list.reduce
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  list.reduce(xs, (max, x) => int.max(max, x))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected RParen at line 17:12 (got Colon ':')
  --> /tmp/dojo-max-of-list-2.almd:17:12
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
17 |     some(x :: xs) => if list.is_empty(xs) then some(x) else list.max(xs, x)
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:1 (got RBrace '}')
  --> /tmp/dojo-max-of-list-2.almd:19:1
   |
19 | }
   | ^
error[E012]: duplicate function 'max_of_list'
  at line 8
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
  | -------------------------------------- first definition of 'max_of_list' here
...
8 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
  | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'max_of_list'
  at line 14
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
   | -------------------------------------- first definition of 'max_of_list' here
...
14 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'max_of_list'
  at line 22
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
   | -------------------------------------- first definition of 'max_of_list' here
...
22 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-2.almd:3:35
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  |                                   ^
error[E005]: argument 'f' expects fn(fn(Int, Int) -> Int, Int) -> fn(Int, Int) -> Int but got fn(Int, Int) -> Int
  --> /tmp/dojo-max-of-list-2.almd:10:56
  in call to list.fold()
  hint: Fix the argument type
   |
10 |   else list.fold(xs, int.min, (max, x) => int.max(max, x))
   |                                                        ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-2.almd:3:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value(), (max, x) => int.max(max, x))
  |                                                                ^
error[E001]: type mismatch in call to list.fold(): expected fn(fn(Int, Int) -> Int, Int) -> fn(Int, Int) -> Int but got fn(Int, Int) -> Int
  --> /tmp/dojo-max-of-list-2.almd:10:56
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
10 |   else list.fold(xs, int.min, (max, x) => int.max(max, x))
   |                                                        ^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(Int, Int) -> Int
  --> /tmp/dojo-max-of-list-2.almd:10:56
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
10 |   else list.fold(xs, int.min, (max, x) => int.max(max, x))
   |                                                        ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Unit
  --> /tmp/dojo-max-of-list-2.almd:14:48
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
14 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
   |                                                ^

11 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  match xs {
    none => none
    some(x :: xs) => match xs {
      none => some(x)
      some(xs) => list.fold(xs, x, (max, x) => int.max(max, x))
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected RParen at line 4:12 (got Colon ':')
  --> /tmp/dojo-max-of-list-3.almd:4:12
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |     some(x :: xs) => match xs {
  |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:3 (got RBrace '}')
  --> /tmp/dojo-max-of-list-3.almd:8:3
  |
8 |   }
  |   ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Unit
  --> /tmp/dojo-max-of-list-3.almd:1:48
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] = {
  |                                                ^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
