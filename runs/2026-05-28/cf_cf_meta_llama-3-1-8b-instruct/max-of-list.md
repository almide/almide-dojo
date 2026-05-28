# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] {
  if list.is_empty(xs) {
    none
  } else {
    list.fold(xs, int.min_value(), (acc, x) => int.max(acc, x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Missing '=' before function body at line 1:46
  --> /tmp/dojo-max-of-list-0.almd:1:46
  hint: Almide requires '=' before the body. Write: fn max_of_list(...) -> Type = { ... }
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] {
  |                                              ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) {
    none
  } else {
    list.fold(xs, int.min_value(), (acc, x) => int.max(acc, x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-max-of-list-1.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(xs) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-max-of-list-1.almd:4:5
  |
4 |   } else {
  |     ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Unit
  --> /tmp/dojo-max-of-list-1.almd:1:48
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
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) {
    none
  } else {
    list.fold(xs, int.min_value(), (acc, x) => int.max(acc, x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-max-of-list-2.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(xs) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-max-of-list-2.almd:4:5
  |
4 |   } else {
  |     ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Unit
  --> /tmp/dojo-max-of-list-2.almd:1:48
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
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) {
    none
  } else {
    list.fold(xs, int.min_value(), (acc, x) => int.max(acc, x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-max-of-list-3.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(xs) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-max-of-list-3.almd:4:5
  |
4 |   } else {
  |     ^
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
