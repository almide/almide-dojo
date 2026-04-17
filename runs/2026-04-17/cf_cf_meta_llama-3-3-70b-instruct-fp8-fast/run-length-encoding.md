# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = 
    string.run_length_encode(s) 
    |> list.map((x) => int.to_string(x.1) + x.0)
  in string.join(encoded, "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then
    ""
  else
    let chars = string.chars(s)
    in list.fold(chars, "", (acc, x) => 
      if string.is_digit(x) then
        acc + string.repeat(string.get(string.drop(s, list.len(acc)), list.len(acc)), int.parse(x).unwrap_or(1))
      else
        acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:11:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let chars = string.chars(s)
   |     ^^^

1 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> list.map((x) => int.to_string(x.1) + x.0)
  |> string.join("", "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then
    ""
  else
    string.chars(s)
    |> list.fold("", (acc, x) => 
      if string.is_digit(x) then
        acc + string.repeat(string.get(string.drop(s, list.len(acc)), list.len(acc)), int.parse(x).unwrap_or(1))
      else
        acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-1.almd:4:22
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
4 |   |> string.join("", "")
  |                      ^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:13:97
  in call to string.repeat()
  hint: Fix the argument type
   |
13 |         acc + string.repeat(string.get(string.drop(s, list.len(acc)), list.len(acc)), int.parse(x).unwrap_or(1))
   |                                                                                                 ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(List[A], String) -> List[A]
  --> /tmp/dojo-run-length-encoding-1.almd:15:15
  in call to list.fold()
  hint: Fix the argument type
   |
15 |         acc + x)
   |               ^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:13:97
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
13 |         acc + string.repeat(string.get(string.drop(s, list.len(acc)), list.len(acc)), int.parse(x).unwrap_or(1))
   |                                                                                                 ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(List[A], String) -> List[A]
  --> /tmp/dojo-run-length-encoding-1.almd:15:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
15 |         acc + x)
   |               ^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn rle_encode(s: String) -> String = 
  string.run_length_encode(s) 
  |> list.map((x) => int.to_string(x.1) + x.0)
  |> list.fold("", (acc, x) => acc + x)

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then
    ""
  else
    string.chars(s)
    |> list.fold(("", 0), (acc, x) => 
      if string.is_digit(x) then
        (acc.0, acc.1 * 10 + int.parse(x).unwrap_or(0))
      else
        (acc.0 + string.repeat(x, acc.1), 0))
    |> (x) => x.0
```
