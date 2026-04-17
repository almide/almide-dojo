# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.run_length_encode(s) in
  list.fold(encoded, "", (acc, (ch, count)) => acc + int.to_string(count) + ch)

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then ""
  else
    let chars = string.chars(s) in
    let pairs = list.chunk(chars, 2) in
    let decoded = list.map(pairs, (x) => 
      match x with
        [count, ch] => string.repeat(ch, int.parse(count).unwrap_or(0))
        _ => ""
    ) in
    list.fold(decoded, "", (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let chars = string.chars(s) in
  |     ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-0.almd:3:68
  in variable count
  hint: Check the variable name
  |
3 |   list.fold(encoded, "", (acc, (ch, count)) => acc + int.to_string(count) + ch)
  |                                                                    ^^^^^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.run_length_encode(s) in
  list.fold(encoded, "", (acc, (ch, cnt)) => acc + int.to_string(cnt) + ch)

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then ""
  else
    let chars = string.chars(s) in
    let pairs = list.chunk(chars, 2) in
    list.fold(pairs, "", (acc, pair) => 
      match pair with
        [count, ch] => acc + string.repeat(ch, int.parse(count).unwrap_or(0))
        _ => acc
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let chars = string.chars(s) in
  |     ^^^
error[E003]: undefined variable 'cnt'
  --> /tmp/dojo-run-length-encoding-1.almd:3:66
  in variable cnt
  hint: Did you mean `ch`?
  try:
      // cnt  →  ch
      ch
  |
3 |   list.fold(encoded, "", (acc, (ch, cnt)) => acc + int.to_string(cnt) + ch)
  |                                                                  ^^^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> list.fold("", (acc, (ch, cnt)) => acc + int.to_string(cnt) + ch)

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then 
    ""
  else 
    string.chars(s) 
    |> list.chunk(2) 
    |> list.fold("", (acc, pair) => 
      match pair with 
        [count, ch] => acc + string.repeat(ch, int.parse(count).unwrap_or(0))
        _ => acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected LBrace at line 12:18 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-2.almd:12:18
   |
12 |       match pair with
   |                  ^
error[E003]: undefined variable 'cnt'
  --> /tmp/dojo-run-length-encoding-2.almd:3:60
  in variable cnt
  hint: Did you mean `ch`?
  try:
      // cnt  →  ch
      ch
  |
3 |   |> list.fold("", (acc, (ch, cnt)) => acc + int.to_string(cnt) + ch)
  |                                                            ^^^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> list.fold("", (acc, (ch, count)) => acc + int.to_string(count) + ch)

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then 
    ""
  else 
    string.chars(s) 
    |> list.chunk(2) 
    |> list.fold("", (acc, pair) => 
      match pair {
        [count, ch] => acc + string.repeat(ch, int.parse(count).unwrap_or(0))
        _ => acc
      })
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-3.almd:3:62
  in variable count
  hint: Check the variable name
  |
3 |   |> list.fold("", (acc, (ch, count)) => acc + int.to_string(count) + ch)
  |                                                              ^^^^^

1 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
