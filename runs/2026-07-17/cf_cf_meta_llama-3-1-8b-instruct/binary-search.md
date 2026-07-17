# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none 
    else 
        let mid = list.len(xs) / 2 
        let mid_val = option.unwrap_or(list.get(xs, mid), 0) 
        if target == mid_val then 
            some(mid) 
        else if target < mid_val then 
            binary_search(list.drop(xs, 1), target) 
        else 
            binary_search(list.drop_end(xs, 1), target)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let mid = list.len(xs) / 2
  |         ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none 
    else 
        let mid = list.len(xs) / 2 
        let mid_val = option.unwrap_or(list.get(xs, mid), 0) 
        if target == mid_val then 
            some(mid) 
        else if target < mid_val then 
            binary_search(list.drop(xs, 1), target) 
        else 
            binary_search(list.drop_end(xs, 1), target)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let mid = list.len(xs) / 2
  |         ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none 
    else 
        let mid = list.len(xs) / 2 
        let mid_val = option.unwrap_or(list.get(xs, mid), 0) 
        if target == mid_val then 
            some(mid) 
        else if target < mid_val then 
            binary_search(list.drop(xs, 1), target) 
        else 
            binary_search(list.drop_end(xs, 1), target)

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none 
    else 
        let mid = (list.len(xs) - 1) / 2 
        let mid_val = option.unwrap_or(list.get(xs, mid), 0) 
        if target == mid_val then 
            some(mid) 
        else if target < mid_val then 
            binary_search(list.drop(xs, 1), target) 
        else 
            binary_search(list.drop_end(xs, 1), target)

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    let rec func(i
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let mid = list.len(xs) / 2
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:18:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let mid = (list.len(xs) - 1) / 2
   |         ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:28:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
28 |     let rec func(i
   |         ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:28:5
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
28 |     let rec func(i
   |     ^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
    if list.is_empty(xs) then
        none
    else
        let mid = (list.len(xs) - 1) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), 0)
        if target == mid_val then
            some(mid)
        else if target < mid_val then
            binary_search(list.drop(xs, 1), target)
        else
            binary_search(list.drop_end(xs, 1), target)

fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
    if list.is_empty(xs) then
        none
    else
        let mid = (list.len(xs) - 1) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), 0)
        if target == mid_val then
            some(mid)
        else if target < mid_val then
            binary_search(list.drop(xs, 1), target)
        else
            binary_search(list.drop_end(xs, 1), target)

fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
    let rec func(xs: List[Int],
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let mid = (list.len(xs) - 1) / 2
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:18:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let mid = (list.len(xs) - 1) / 2
   |         ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:28:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
28 |     let rec func(xs: List[Int],
   |         ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:28:5
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
28 |     let rec func(xs: List[Int],
   |     ^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
