# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = list.map(string.run_length_encode(s), (x, n) => int.to_string(n) + x)
  in string.join(encoded, "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then ""
  else
    let parts = string.split(s, "")
    in 
      let decoded = list.flat_map(list.enum(parts), (i, part) => 
        if i % 2 == 0 then 
          list.repeat(string.get_or(parts, i + 1, ""), int.parse(part).unwrap_or(0))
        else []
      )
      in string.join(decoded, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let parts = string.split(s, "")
  |     ^^^
error[E005]: argument 'f' expects fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-0.almd:2:84
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let encoded = list.map(string.run_length_encode(s), (x, n) => int.to_string(n) + x)
  |                                                                                    ^
error[E001]: type mismatch in call to list.map(): expected fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-0.almd:2:84
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let encoded = list.map(string.run_length_encode(s), (x, n) => int.to_string(n) + x)
  |                                                                                    ^

3 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.join(list.map(string.run_length_encode(s), (x, n) => int.to_string(n) + x), "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then ""
  else
    let parts = string.split(s, "")
    in 
      string.join(list.flat_map(list.enum(parts), (i, part) => 
        if i % 2 == 0 then 
          list.repeat(string.get_or(parts, i + 1, ""), int.parse(part).unwrap_or(0))
        else []
      ), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let parts = string.split(s, "")
  |     ^^^
error[E005]: argument 'f' expects fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:2:82
  in call to list.map()
  hint: Fix the argument type
  |
2 |   string.join(list.map(string.run_length_encode(s), (x, n) => int.to_string(n) + x), "")
  |                                                                                  ^
error[E001]: type mismatch in call to list.map(): expected fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:2:82
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   string.join(list.map(string.run_length_encode(s), (x, n) => int.to_string(n) + x), "")
  |                                                                                  ^

3 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.join(list.map(string.run_length_encode(s), (x) => int.to_string(x.1) + x.0), "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then ""
  else
    let parts = string.split(s, "")
    in 
      string.join(list.flat_map(list.enum(parts), (i, part) => 
        if i % 2 == 0 then 
          list.repeat(string.get_or(parts, i + 1, ""), int.parse(part).unwrap_or(0))
        else []
      ), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-2.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let parts = string.split(s, "")
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.join(list.map(string.run_length_encode(s), (x) => int.to_string(x.1) + x.0), "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then ""
  else
    string.join(list.flat_map(list.enum(string.split(s, "")), (i, part) => 
      if i % 2 == 0 then 
        list.repeat(string.get_or(string.split(s, ""), i + 1, ""), int.parse(part).unwrap_or(0))
      else []
    ), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E002]: undefined function 'list.enum'
  --> /tmp/dojo-run-length-encoding-3.almd:7:57
  in call to list.enum()
  hint: Did you mean `list.sum`?
  try:
      // list.enum(...)  →  list.sum(...)
      list.sum(...)
  |
7 |     string.join(list.flat_map(list.enum(string.split(s, "")), (i, part) =>
  |                                                         ^^
error[E002]: undefined function 'string.get_or'
  --> /tmp/dojo-run-length-encoding-3.almd:9:63
  in call to string.get_or()
  hint: No function 'get_or' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |         list.repeat(string.get_or(string.split(s, ""), i + 1, ""), int.parse(part).unwrap_or(0))
  |                                                               ^^
error[E005]: argument 'f' expects fn(A) -> List[B] but got fn(Int, String) -> List[?3]
  --> /tmp/dojo-run-length-encoding-3.almd:10:12
  in call to list.flat_map()
  hint: Fix the argument type
   |
10 |       else []
   |            ^
error[E001]: type mismatch in call to list.flat_map(): expected fn(A) -> List[B] but got fn(Int, String) -> List[?3]
  --> /tmp/dojo-run-length-encoding-3.almd:10:12
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
10 |       else []
   |            ^

4 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
