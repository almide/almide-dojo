# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int): Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-0.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int): Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int): Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:1:63
  in fn 'binary_search'
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
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

4 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int): Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn main() = {
  let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
  let result = binary_search(xs, 5)
  match result {
    some(index) => println(index),
    none => println("not found")
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int): Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int): Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error: Missing return type at line 20:11
  --> /tmp/dojo-binary-search-1.almd:20:11
  here: fn main() = {
  hint: every fn declares its return type and takes '=' before its body:
        fn main() -> Unit = { ... }
        a main that performs IO (fs, http, ...) should be:  effect fn main() -> Unit = { ... }
   |
20 | fn main() = {
   |           ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:1:63
  in fn 'binary_search'
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
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

5 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int): Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn main() -> Unit = {
  let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
  let result = binary_search(xs, 5)
  match result {
    some(index) => println(index),
    none => println("not found")
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-2.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int): Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int): Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-binary-search-2.almd:21:52
  in call to list.from_list()
  here: let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
21 |   let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
   |                                                    ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:1:63
  in fn 'binary_search'
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
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
error[E001]: type mismatch in call to println(): expected String but got Int
  --> /tmp/dojo-binary-search-2.almd:24:28
  in call to println()
  here: some(index) => println(index),
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
24 |     some(index) => println(index),
   |                            ^^^^^

6 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int): Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn main() -> Unit = {
  let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
  let result = binary_search(xs, 5)
  match result {
    some(index) => println(int.to_string(index)),
    none => println("not found")
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-3.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int): Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int): Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-binary-search-3.almd:21:52
  in call to list.from_list()
  here: let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
21 |   let xs = list.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9])
   |                                                    ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:1:63
  in fn 'binary_search'
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
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

5 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
