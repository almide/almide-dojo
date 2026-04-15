# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  in if len == 0 then none
  else 
    let 
      (low, high) = (0, len - 1)
      loop = (low: Int, high: Int) => 
        if low > high then none
        else 
          let mid = (low + high) / 2
          in 
            match list.get(xs, mid) with 
              some(val) => 
                if val == target then some(mid)
                else if val < target then loop(mid + 1, high)
                else loop(low, mid - 1)
              none => none
    in loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:3:3
  |
3 |   in if len == 0 then none
  |   ^
error: Expected identifier at line 5:9 (got Newline '')
  --> /tmp/dojo-binary-search-0.almd:5:9
  |
5 |     let
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:10:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2
   |           ^^^
error: Expected LBrace at line 12:37 (got Ident 'with')
  --> /tmp/dojo-binary-search-0.almd:12:37
   |
12 |             match list.get(xs, mid) with
   |                                     ^
error: 'loop' is not valid in Almide at line 15:43
  --> /tmp/dojo-binary-search-0.almd:15:43
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |                 else if val < target then loop(mid + 1, high)
   |                                           ^
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

6 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else 
    let (low, high) = (0, list.len(xs) - 1)
    in 
      {
        let rec loop = (low: Int, high: Int) => 
          if low > high then none
          else 
            let mid = (low + high) / 2
            in 
              match list.get(xs, mid) with 
                some(val) => 
                  if val == target then some(mid)
                  else if val < target then loop(mid + 1, high)
                  else loop(low, mid - 1)
                none => none
        ; loop(low, high)
      }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let (low, high) = (0, list.len(xs) - 1)
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else 
    {
      let low = 0
      let high = list.len(xs) - 1
      let rec loop = (low: Int, high: Int) => 
        if low > high then none
        else 
          let mid = (low + high) / 2
          in 
            match list.get(xs, mid) with 
              some(val) => 
                if val == target then some(mid)
                else if val < target then loop(mid + 1, high)
                else loop(low, mid - 1)
              none => none
      ; loop(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:7:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |       let rec loop = (low: Int, high: Int) =>
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:10:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2
   |           ^^^
error: Expected LBrace at line 12:37 (got Ident 'with')
  --> /tmp/dojo-binary-search-2.almd:12:37
   |
12 |             match list.get(xs, mid) with
   |                                     ^
error: 'loop' is not valid in Almide at line 15:43
  --> /tmp/dojo-binary-search-2.almd:15:43
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |                 else if val < target then loop(mid + 1, high)
   |                                           ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:6:33
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
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
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else 
    {
      let low = 0
      let high = list.len(xs) - 1
      fn loop(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          let mid = (low + high) / 2
          in 
            match list.get(xs, mid) with 
              some(val) => 
                if val == target then some(mid)
                else if val < target then loop(mid + 1, high)
                else loop(low, mid - 1)
              none => none
      ; loop(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 7:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:7:7
  |
7 |       fn loop(low: Int, high: Int) -> Option[Int] =
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:10:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2
   |           ^^^
error: Expected LBrace at line 12:37 (got Ident 'with')
  --> /tmp/dojo-binary-search-3.almd:12:37
   |
12 |             match list.get(xs, mid) with
   |                                     ^
error: 'loop' is not valid in Almide at line 15:43
  --> /tmp/dojo-binary-search-3.almd:15:43
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |                 else if val < target then loop(mid + 1, high)
   |                                           ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:6:33
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
6 |       let high = list.len(xs) - 1
  |                                 ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
