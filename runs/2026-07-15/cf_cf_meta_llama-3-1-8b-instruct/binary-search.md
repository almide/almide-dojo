# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  match list.binary_search(xs, target) {
    some(index) => some(index)
    none => match (0..len).find(i => list.get(xs, i).unwrap_or(-1) == target) {
      some(index) => some(index)
      none => none
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-binary-search-0.almd:5:35
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |     none => match (0..len).find(i => list.get(xs, i).unwrap_or(-1) == target) {
  |                                   ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:9:3
  |
9 |   }
  |   ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:2:22
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
2 |   let len = list.len(xs)
  |                      ^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  match list.binary_search(xs, target) {
    some(index) => some(index)
    none => match (0..len).find(i => list.get(xs, i).unwrap_or(-1) == target) {
      some(index) => some(index)
      none => none
    }
  }
  none // This line was missing to return Unit if list is empty
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) {
    none
  } else {
    match list.binary_search(xs, target) {
      some(index) => some(index)
      none => match (0..list.len(xs)).find(i => list.get(xs, i).unwrap_or(-1) == target) {
        some(index) => some(index)
        none => none
      }
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-binary-search-1.almd:5:35
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |     none => match (0..len).find(i => list.get(xs, i).unwrap_or(-1) == target) {
  |                                   ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-1.almd:9:3
  |
9 |   }
  |   ^
error: Expected Then at line 14:24 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:14:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
14 |   if list.is_empty(xs) {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:5 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:16:5
   |
16 |   } else {
   |     ^
error[E012]: duplicate function 'binary_search'
  at line 13
  in fn binary_search
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
13 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:2:22
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
2 |   let len = list.len(xs)
  |                      ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:13:63
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
13 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   |                                                               ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) {
    none
  } else {
    match list.binary_search(xs, target) {
      some(index) => some(index)
      none => list.find_index(xs, i => list.get(xs, i).unwrap_or(-1) == target)
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(xs) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:4:5
  |
4 |   } else {
  |     ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:1:63
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) {
    none
  } else {
    match list.binary_search(xs, target) {
      some(index) => some(index)
      none => {
        let lo = 0
        let hi = list.len(xs) - 1
        while lo <= hi {
          let mid = (lo + hi) / 2
          match list.get(xs, mid) {
            some(x) => {
              if x == target {
                some(mid)
              } else if x < target {
                lo = mid + 1
              } else {
                hi = mid - 1
              }
            }
            none => {
              hi = mid - 1
            }
          }
        }
        none
      }
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(xs) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:4:5
  |
4 |   } else {
  |     ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:1:63
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
