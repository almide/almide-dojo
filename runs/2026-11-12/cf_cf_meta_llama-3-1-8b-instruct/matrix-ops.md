# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:9:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let ncols = list.len(list.first(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 9:5
  --> /tmp/dojo-matrix-ops-0.almd:9:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     let ncols = list.len(list.first(m))
  |     ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:4:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  |                                                        ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) =>
  |           ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 9:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] 
  else 
    list.map(a, (row_a) => 
      list.map(row_a, (x) => 
        list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] 
  else 
    let ncols = list.len(list.first(a))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(list.range(0, list.len(a)), (row_idx) => 
        list.get(a, row_idx) ?? 0 + list.get(b, row_idx) ?? 0))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:9:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let ncols = list.len(list.first(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 9:5
  --> /tmp/dojo-matrix-ops-1.almd:9:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     let ncols = list.len(list.first(m))
  |     ^
error: '||' is not valid in Almide
  --> /tmp/dojo-matrix-ops-1.almd:20:23
  in operator
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
20 |   if list.is_empty(a) || list.is_empty(b) then []
   |                       ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:29:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
29 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 29:5
  --> /tmp/dojo-matrix-ops-1.almd:29:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |     let ncols = list.len(list.first(m))
   |     ^
error: '||' is not valid in Almide
  --> /tmp/dojo-matrix-ops-1.almd:40:23
  in operator
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
40 |   if list.is_empty(a) || list.is_empty(b) then []
   |                       ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:42:5
  in let-in
  here: let ncols = list.len(list.first(a))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
42 |     let ncols = list.len(list.first(a))
   |     ^^^
error: 'let' is not an expression in Almide at line 42:5
  --> /tmp/dojo-matrix-ops-1.almd:42:5
  here: let ncols = list.len(list.first(a))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 |     let ncols = list.len(list.first(a))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:50:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
50 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 50:5
  --> /tmp/dojo-matrix-ops-1.almd:50:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
50 |     let ncols = list.len(list.first(m))
   |     ^
error[E012]: duplicate function 'mat_add'
  at line 19
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
19 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 26
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
26 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 33
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
13 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
33 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 36
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
36 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 39
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
39 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 47
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
47 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 54
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
13 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
54 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 57
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
57 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:4:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:24:58
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Use + with numeric types, String, List, or Bytes
   |
24 |         list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
   |                                                          ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:4:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) =>
  |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:24:54
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
24 |         list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
   |                                                      ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:20:48
  in fn 'mat_add'
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Fix the expression type or change the expected type
   |
20 |   if list.is_empty(a) || list.is_empty(b) then []
   |                                                ^

24 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 9:5
  parse error: '||' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] 
  else 
    list.map(a, (row_a) => 
      list.map(row_a, (x) => 
        list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] 
  else 
    let ncols = list.len(list.first(a))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(list.range(0, list.len(a)), (row_idx) => 
        list.get(a, row_idx) ?? 0 + list.get(b, row_idx) ?? 0))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
```

**Diagnostic:**

```
error: '||' is not valid in Almide
  --> /tmp/dojo-matrix-ops-2.almd:2:23
  in operator
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
  |
2 |   if list.is_empty(a) || list.is_empty(b) then []
  |                       ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:11:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-matrix-ops-2.almd:11:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let ncols = list.len(list.first(m))
   |     ^
error: '||' is not valid in Almide
  --> /tmp/dojo-matrix-ops-2.almd:22:23
  in operator
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
22 |   if list.is_empty(a) || list.is_empty(b) then []
   |                       ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:24:5
  in let-in
  here: let ncols = list.len(list.first(a))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |     let ncols = list.len(list.first(a))
   |     ^^^
error: 'let' is not an expression in Almide at line 24:5
  --> /tmp/dojo-matrix-ops-2.almd:24:5
  here: let ncols = list.len(list.first(a))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     let ncols = list.len(list.first(a))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:32:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
32 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 32:5
  --> /tmp/dojo-matrix-ops-2.almd:32:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 |     let ncols = list.len(list.first(m))
   |     ^
error[E012]: duplicate function 'mat_add'
  at line 21
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
21 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 29
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
29 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 36
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
36 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 39
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
18 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
39 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:6:58
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Use + with numeric types, String, List, or Bytes
  |
6 |         list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  |                                                          ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:6:54
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x))
  |                                                      ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:2:48
  in fn 'mat_add'
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Fix the expression type or change the expected type
  |
2 |   if list.is_empty(a) || list.is_empty(b) then []
  |                                                ^

15 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
  parse error: '||' is not valid in Almide
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 11:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) or list.is_empty(b) then [] 
  else 
    let ncols = list.len(list.first(a))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(list.range(0, list.len(a)), (row_idx) => 
        list.get(a, row_idx) ?? 0 + list.get(b, row_idx) ?? 0))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:4:5
  in let-in
  here: let ncols = list.len(list.first(a))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let ncols = list.len(list.first(a))
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-matrix-ops-3.almd:4:5
  here: let ncols = list.len(list.first(a))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let ncols = list.len(list.first(a))
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:12:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 12:5
  --> /tmp/dojo-matrix-ops-3.almd:12:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     let ncols = list.len(list.first(m))
   |     ^

4 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 4:5
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
