# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  in if len == 0 then none
  else let rec search(low: Int, high: Int) = 
    if low > high then none
    else let mid = (low + high) / 2
         in if (list.get(xs, mid) ?? -1) == target then some(mid)
            else if (list.get(xs, mid) ?? -1) < target then search(mid + 1, high)
            else search(low, mid - 1)
  in search(0, len - 1)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:4:8
  in let-in
  here: else let rec search(low: Int, high: Int) =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |   else let rec search(low: Int, high: Int) =
  |        ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:6:10
  in let-in
  here: else let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     else let mid = (low + high) / 2
  |          ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:2:22
  in fn 'binary_search'
  here: let len = list.len(xs)
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
FAILED: /tmp/dojo-binary-search-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else {
    fn search(low: Int, high: Int) -> Option[Int] = 
      if low > high then none
      else {
        let mid = (low + high) / 2
        in if (list.get(xs, mid) ?? -1) == target then some(mid)
           else if (list.get(xs, mid) ?? -1) < target then search(mid + 1, high)
           else search(low, mid - 1)
      }
    search(0, list.len(xs) - 1)
  }
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:4:5
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
4 |     fn search(low: Int, high: Int) -> Option[Int] =
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: `fn` cannot be declared inside a function body
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn search(low: Int, high: Int, xs: List[Int], target: Int) -> Option[Int] = 
  if low > high then none
  else {
    let mid = (low + high) / 2
    in if (list.get(xs, mid) ?? -1) == target then some(mid)
       else if (list.get(xs, mid) ?? -1) < target then search(mid + 1, high, xs, target)
       else search(low, mid - 1, xs, target)
  }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else search(0, list.len(xs) - 1, xs, target)
```
