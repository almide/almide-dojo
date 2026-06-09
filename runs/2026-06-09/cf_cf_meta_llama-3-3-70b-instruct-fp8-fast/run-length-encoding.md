# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
    string.run_length_encode(s)
    |> list.map((char, count) => int.to_string(count) + char)
    |> list.join(_, "")
}

fn rle_decode(s: String) -> String {
    if string.is_empty(s) then
        ""
    else
        let
            chars = string.chars(s)
            |> list.chunk(2)
            |> list.map((x) => (
                int.parse(x |> list.first(_) |> option.unwrap_or_("", ()),
                x |> list.drop(_, 1) |> list.first(_) |> option.unwrap_or_("", "")
            ))
            |> list.map((count, char) => string.repeat(char, count))
        in
            list.join(chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-run-length-encoding-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn rle_encode(...) -> Type = { ... }
  |
1 | fn rle_encode(s: String) -> String {
  |                                    ^
error: Missing '=' before function body at line 7:36
  --> /tmp/dojo-run-length-encoding-0.almd:7:36
  hint: Almide requires '=' before the body. Write: fn rle_decode(...) -> Type = { ... }
  |
7 | fn rle_decode(s: String) -> String {
  |                                    ^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
    string.run_length_encode(s) 
    |> list.map((char, count) => int.to_string(count) + char) 
    |> list.join(_, "")

fn rle_decode(s: String) -> String = 
    if string.is_empty(s) then 
        ""
    else 
        let 
            chars = string.chars(s) 
            |> list.chunk(2) 
            |> list.map((x) => (
                int.parse(x |> list.first(_) |> option.unwrap_or("", ())) 
                |> result.unwrap_or(1),
                x |> list.drop(_, 1) |> list.first(_) |> option.unwrap_or("", "")
            ))
            |> list.map((count, char) => string.repeat(char, count))
        in 
            list.join(chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let
   |         ^^^
error[E005]: argument 'f' expects fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:3:57
  in call to list.map()
  hint: Fix the argument type
  |
3 |     |> list.map((char, count) => int.to_string(count) + char)
  |                                                         ^^^^
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-1.almd:4:21
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
  |
4 |     |> list.join(_, "")
  |                     ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:3:57
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     |> list.map((char, count) => int.to_string(count) + char)
  |                                                         ^^^^

4 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
    string.run_length_encode(s) 
    |> list.map((char, count) => int.to_string(count) + char) 
    |> string.join(_, "")

fn rle_decode(s: String) -> String = 
    if string.is_empty(s) then 
        ""
    else 
        let 
            chars = string.chars(s) 
            |> list.chunk(2) 
            |> list.map((x) => (
                int.parse(x |> list.first(_) |> option.unwrap_or("", ())) 
                |> result.unwrap_or(1),
                x |> list.drop(_, 1) |> list.first(_) |> option.unwrap_or("", "")
            ))
        in 
            list.map(chars, (count, char) => string.repeat(char, count))
            |> string.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-2.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let
   |         ^^^
error[E005]: argument 'f' expects fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-2.almd:3:57
  in call to list.map()
  hint: Fix the argument type
  |
3 |     |> list.map((char, count) => int.to_string(count) + char)
  |                                                         ^^^^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-2.almd:4:23
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
4 |     |> string.join(_, "")
  |                       ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-2.almd:3:57
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     |> list.map((char, count) => int.to_string(count) + char)
  |                                                         ^^^^

4 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
    string.run_length_encode(s) 
    |> list.map((char, count) => int.to_string(count) + char) 
    |> list.map(string.to_upper(_)) 
    |> string.join(_, "")

fn rle_decode(s: String) -> String = 
    if string.is_empty(s) then 
        ""
    else 
        let chars = string.chars(s) 
        in 
            list.chunk(chars, 2) 
            |> list.map((x) => (
                int.parse(list.first(x) |> option.unwrap_or("1")) 
                |> result.unwrap_or(1),
                list.drop(x, 1) |> list.first(_) |> option.unwrap_or("", "")
            ))
            |> list.map((count, char) => string.repeat(char, count))
            |> string.join(_, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-3.almd:11:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |         let chars = string.chars(s)
   |         ^^^
error[E005]: argument 'f' expects fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-3.almd:3:57
  in call to list.map()
  hint: Fix the argument type
  |
3 |     |> list.map((char, count) => int.to_string(count) + char)
  |                                                         ^^^^
error[E005]: argument 'f' expects fn(?2) -> B but got String
  --> /tmp/dojo-run-length-encoding-3.almd:4:33
  in call to list.map()
  hint: Fix the argument type
  |
4 |     |> list.map(string.to_upper(_))
  |                                 ^
error[E004]: string.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-3.almd:5:23
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 3
      string.join(<list: List[String]>, <sep: String>)
  |
5 |     |> string.join(_, "")
  |                       ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, Int)) -> B but got fn(?0, Int) -> String
  --> /tmp/dojo-run-length-encoding-3.almd:3:57
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     |> list.map((char, count) => int.to_string(count) + char)
  |                                                         ^^^^
error[E001]: type mismatch in call to list.map(): expected fn(?2) -> B but got String
  --> /tmp/dojo-run-length-encoding-3.almd:4:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |     |> list.map(string.to_upper(_))
  |                                 ^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
