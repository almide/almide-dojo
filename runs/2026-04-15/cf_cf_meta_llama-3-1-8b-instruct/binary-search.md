# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  | xs, target | 
    if list.len(xs) == 0 then 
      none 
    else 
      let mid = list.len(xs) / 2 
      match list.get(xs, mid) do 
        some(mid_val) => 
          if mid_val == target then 
            some(mid) 
          else if mid_val < target then 
            binary_search(list.drop(xs, mid + 1), target) 
          else 
            binary_search(list.drop(xs, 0), target) 
        none => none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: '|x|' closure syntax is not valid in Almide at line 2:3
  --> /tmp/dojo-binary-search-0.almd:2:3
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   | xs, target |
  |   ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  | (xs, target) | 
    if list.len(xs) == 0 then 
      none 
    else 
      let mid = list.len(xs) / 2 
      match list.get(xs, mid) do 
        some(mid_val) => 
          if mid_val == target then 
            some(mid) 
          else if mid_val < target then 
            binary_search(list.drop(xs, mid + 1), target) 
          else 
            binary_search(list.drop(xs, 0), target) 
        none => none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:3 (got Pipe '|')
  --> /tmp/dojo-binary-search-1.almd:2:3
  |
2 |   | (xs, target) |
  |   ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none 
  else 
    let mid = list.len(xs) / 2 
    match list.get(xs, mid) do 
      some(mid_val) => 
        if mid_val == target then 
          some(mid) 
        else if mid_val < target then 
          binary_search(list.drop(xs, mid + 1), target) 
        else 
          binary_search(list.drop(xs, 0), target) 
      none => none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let mid = list.len(xs) / 2
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none 
  else 
    let mid = list.len(xs) / 2 
    match list.get(xs, mid) do 
      some(mid_val) => 
        if mid_val == target then 
          some(mid) 
        else if mid_val < target then 
          binary_search(list.drop(xs, mid + 1), target) 
        else 
          binary_search(list.drop(xs, 0), target) 
      none => none 

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none 
  else 
    let mid = list.len(xs) / 2 
    match list.get(xs, mid) do 
      some(mid_val) => 
        if mid_val == target then 
          some(mid) 
        else if mid_val < target then 
          let left = list.drop(xs, mid + 1) 
          binary_search(left, target) 
        else 
          let right = list.drop(xs, 0) 
          binary_search(right, target) 
      none =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let mid = list.len(xs) / 2
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:20:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |     let mid = list.len(xs) / 2
   |     ^^^

2 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
