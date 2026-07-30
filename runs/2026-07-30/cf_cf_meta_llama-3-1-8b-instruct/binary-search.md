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
  match list.get(xs, 0) {
    some(first) =>
      match first {
        some(_) =>
          match list.get(xs, len - 1) {
            some(last) =>
              match last {
                some(_) =>
                  match target {
                    first when first <= target => binary_search(xs, target)
                    last when last >= target => binary_search(list.drop(xs, len - last), target)
                    _ => none
                  }
                none => none
              }
            none => none
          }
        none => none
      },
    none => none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected FatArrow at line 12:27 (got Ident 'when')
  --> /tmp/dojo-binary-search-0.almd:12:27
   |
12 |                     first when first <= target => binary_search(xs, target)
   |                           ^
error: Expected expression at line 13:46 (got FatArrow '=>')
  --> /tmp/dojo-binary-search-0.almd:13:46
   |
13 |                     last when last >= target => binary_search(list.drop(xs, len - last), target)
   |                                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:17 (got None 'none')
  --> /tmp/dojo-binary-search-0.almd:16:17
   |
16 |                 none => none
   |                 ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-binary-search-0.almd:13:21
  in variable last
  hint: Check the variable name
   |
13 |                     last when last >= target => binary_search(list.drop(xs, len - last), target)
   |                     ^^^^
error[E003]: undefined variable 'when'
  --> /tmp/dojo-binary-search-0.almd:13:26
  in variable when
  hint: Did you mean `len`?
  try:
      // when  →  len
      len
   |
13 |                     last when last >= target => binary_search(list.drop(xs, len - last), target)
   |                          ^^^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-binary-search-0.almd:13:31
  in variable last
  hint: Check the variable name
   |
13 |                     last when last >= target => binary_search(list.drop(xs, len - last), target)
   |                               ^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:13:39
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
13 |                     last when last >= target => binary_search(list.drop(xs, len - last), target)
   |                                       ^^^^^^

7 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if list.is_empty(xs) {
    none
  } else {
    match list.first(xs) {
      some(first) =>
        match list.last(xs) {
          some(last) =>
            match target {
              first when first <= target => binary_search(xs, target)
              last when last >= target => binary_search(list.drop(xs, len - last), target)
              _ => none
            }
          none => none
        }
      none => none
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected Then at line 3:24 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |   if list.is_empty(xs) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:5 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:5:5
  |
5 |   } else {
  |     ^
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

3 error(s) found
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
    let len = list.len(xs)
    let (first, rest) = list.split_at(xs, 1)
    let first = option.unwrap_or(list.first(first), none)
    let rest = list.drop(rest, 1)
    let mid = list.len(rest) / 2
    let (left, right) = list.split_at(rest, mid)
    match target {
      first when first <= target => binary_search(rest, target)
      first when target < first => none
      _ => binary_search(left, target)
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
    let len = list.len(xs)
    let (first, rest) = list.split_at(xs, 1)
    let first = option.unwrap_or(list.first(first), none)
    let rest = list.drop(rest, 1)
    let mid = list.len(rest) / 2
    let (left, right) = list.split_at(rest, mid)
    let result = if first <= target {
      binary_search(rest, target)
    } else if target < first {
      none
    } else {
      binary_search(left, target)
    }
    result
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
