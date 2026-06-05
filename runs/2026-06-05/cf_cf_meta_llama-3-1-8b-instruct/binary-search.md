# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    | [] => none
    | _ => {
      let low = 0
      let high = list.len(xs) - 1
      while low <= high {
        let mid = (low + high) / 2
        match list.get(xs, mid) {
          | some(mid_val) => {
            if mid_val == target {
              some(mid)
            } else if mid_val < target {
              low = mid + 1
            } else {
              high = mid - 1
            }
          }
          | none => {
            high = mid - 1
          }
        }
      }
      if low >= list.len(xs) {
        none
      } else {
        some(low)
      }
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-binary-search-0.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => none
  |     ^
error: Expected pattern at line 10:11 (got Pipe '|')
  --> /tmp/dojo-binary-search-0.almd:10:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |           | some(mid_val) => {
   |           ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |             if mid_val == target {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:15 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:13:15
   |
13 |             } else if mid_val < target {
   |               ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:6:33
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
6 |       let high = list.len(xs) - 1
  |                                 ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    | [] => none
    | _ => {
      let low = 0
      let high = list.len(xs) - 1
      while low <= high {
        let mid = (low + high) / 2
        match list.get(xs, mid) {
          | some(mid_val) => {
            if mid_val == target {
              some(mid)
            } else if mid_val < target {
              low = mid + 1
            } else {
              high = mid - 1
            }
          }
          | none => {
            none
          }
        }
      }
      none
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-binary-search-1.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => none
  |     ^
error: Expected pattern at line 10:11 (got Pipe '|')
  --> /tmp/dojo-binary-search-1.almd:10:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |           | some(mid_val) => {
   |           ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |             if mid_val == target {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:15 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:13:15
   |
13 |             } else if mid_val < target {
   |               ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:6:33
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
6 |       let high = list.len(xs) - 1
  |                                 ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    | [] => none
    | _ => {
      let low = 0
      let high = list.len(xs) - 1
      while low <= high {
        let mid = (low + high) / 2
        match list.get(xs, mid) {
          | some(mid_val) => {
            if mid_val == target {
              some(mid)
            } else if mid_val < target {
              low = mid + 1
            } else {
              high = mid - 1
            }
          }
          | none => {
            none
          }
        }
      }
      none
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-binary-search-2.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => none
  |     ^
error: Expected pattern at line 10:11 (got Pipe '|')
  --> /tmp/dojo-binary-search-2.almd:10:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |           | some(mid_val) => {
   |           ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |             if mid_val == target {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:15 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:13:15
   |
13 |             } else if mid_val < target {
   |               ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:6:33
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
6 |       let high = list.len(xs) - 1
  |                                 ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    | [] => none
    | _ => {
      let low = 0
      let high = list.len(xs) - 1
      while low <= high {
        let mid = (low + high) / 2
        match list.get(xs, mid) {
          | some(mid_val) => {
            if mid_val == target {
              some(mid)
            } else if mid_val < target {
              low = mid + 1
            } else {
              high = mid - 1
            }
          }
          | none => {
            none
          }
        }
      }
      none
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-binary-search-3.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => none
  |     ^
error: Expected pattern at line 10:11 (got Pipe '|')
  --> /tmp/dojo-binary-search-3.almd:10:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |           | some(mid_val) => {
   |           ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |             if mid_val == target {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:15 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:13:15
   |
13 |             } else if mid_val < target {
   |               ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:6:33
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
6 |       let high = list.len(xs) - 1
  |                                 ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
