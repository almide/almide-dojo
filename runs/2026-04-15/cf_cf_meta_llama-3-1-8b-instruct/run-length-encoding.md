# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.chars(s) |> list.fold("", (acc, c) => 
    match (acc, c) with 
      (none, _) => [int.to_string(1)] + [c]
      (some(count) + [char], char) when char == count.last() => 
        some(count) + [char]
      (some(count) + [char], char) => 
        some(count) + [int.to_string(count.len())] + [char]
  )
  string.join(encoded)

fn rle_decode(s: String) -> String = 
  let decoded = string.chars(s) |> list.fold("", (acc, "+" or char) => 
    match (acc, "+" or char) with 
      (none, "+") => [char]
      (some(count) + [char], "+") => 
        some(count) + [char]
      (some(count) + [char], char) => 
        some(count) + [char]
      (some(count) + [char], int.to_string(n)) => 
        some(count) + [char] + list.fold("", (acc, _) => acc + [char] for
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Expected LBrace at line 3:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-0.almd:3:20
  |
3 |     match (acc, c) with
  |                    ^
error: Expected identifier at line 13:56 (got String '+')
  --> /tmp/dojo-run-length-encoding-0.almd:13:56
   |
13 |   let decoded = string.chars(s) |> list.fold("", (acc, "+" or char) =>
   |                                                        ^
error: Expected LBrace at line 14:30 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-0.almd:14:30
   |
14 |     match (acc, "+" or char) with
   |                              ^
error[E003]: undefined variable 'encoded'
  --> /tmp/dojo-run-length-encoding-0.almd:10:15
  in variable encoded
  hint: Check the variable name
   |
10 |   string.join(encoded)
   |               ^^^^^^^
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-run-length-encoding-0.almd:10:15
  in call to string.join()
  hint: Check the number of arguments
   |
10 |   string.join(encoded)
   |               ^^^^^^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:13:3
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
   |
13 |   let decoded = string.chars(s) |> list.fold("", (acc, "+" or char) =>
   |   ^^^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.chars(s) |> list.fold("", (acc, c) => 
    match (acc, c) with 
      (none, _) => [int.to_string(1)] + [c]
      (some(count) + [char], char) when char == count.last() => 
        some(count) + [char]
      (some(count) + [char], char) => 
        some(count) + [int.to_string(count.len())] + [char]
  )
  string.join(encoded)

fn rle_decode(s: String) -> String = 
  let decoded = string.chars(s) |> list.fold("", (acc, c) => 
    match (acc, c) with 
      (none, '+') => [c]
      (some(count) + [char], '+') => 
        some(count) + [char]
      (some(count) + [char], c) => 
        some(count) + [c]
      (some(count) + [char], int.to_string(n)) => 
        some(count) + [char] + list.fold("", (acc, _) => acc + [char])
  )
  string.join
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: Expected LBrace at line 3:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-1.almd:3:20
  |
3 |     match (acc, c) with
  |                    ^
error: Expected LBrace at line 14:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-1.almd:14:20
   |
14 |     match (acc, c) with
   |                    ^
error[E003]: undefined variable 'encoded'
  --> /tmp/dojo-run-length-encoding-1.almd:10:15
  in variable encoded
  hint: Check the variable name
   |
10 |   string.join(encoded)
   |               ^^^^^^^
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-run-length-encoding-1.almd:10:15
  in call to string.join()
  hint: Check the number of arguments
   |
10 |   string.join(encoded)
   |               ^^^^^^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got fn(List[String], String) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:23:9
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
   |
23 |   string.join
   |         ^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.chars(s) |> list.fold("", (acc, c) => 
    match (acc, c) with 
      (none, _) => [int.to_string(1)] + [c]
      (some(count) + [char], char) when char == count.last() => 
        some(count) + [char]
      (some(count) + [char], char) => 
        some(count) + [int.to_string(count.len())] + [char]
  )
  string.join(encoded, "")

fn rle_decode(s: String) -> String = 
  let decoded = string.chars(s) |> list.fold("", (acc, c) => 
    match (acc, c) with 
      (none, '+') => [c]
      (some(count) + [char], '+') => 
        some(count) + [char]
      (some(count) + [char], c) => 
        some(count) + [c]
      (some(count) + [char], int.to_string(n)) => 
        some(count) + [char] + list.fold("", (acc, _) => acc + [char])
  )
  string
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected LBrace at line 3:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-2.almd:3:20
  |
3 |     match (acc, c) with
  |                    ^
error: Expected LBrace at line 14:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-2.almd:14:20
   |
14 |     match (acc, c) with
   |                    ^
error[E003]: undefined variable 'encoded'
  --> /tmp/dojo-run-length-encoding-2.almd:10:15
  in variable encoded
  hint: Check the variable name
   |
10 |   string.join(encoded, "")
   |               ^^^^^^^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-run-length-encoding-2.almd:23:3
  in variable string
  hint: Check the variable name
   |
23 |   string
   |   ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.chars(s) |> list.fold[label](none, (acc, c) => 
    match (acc, c) with 
      (none, _) => [int.to_string(1)] + [c]
      (some(count) + [char], char) when char == count.last() => 
        some(count) + [char]
      (some(count) + [char], char) => 
        some(count) + [int.to_string(count.len())] + [char]
  )
  list.join(encoded, "")

fn rle_decode(s: String) -> String = 
  let decoded = string.chars(s) |> list.fold(label, (acc, c) => 
    match (acc, c) with 
      (none, '+') => [c]
      (some(count) + [char], '+') => 
        some(count) + [char]
      (some(count) + [char], c) => 
        some(count) + [c]
      (some(count) + [char], int.to_string(n)) => 
        some(count) + [char] + list.fold(label, (acc, _) => acc + [char
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: Expected type name at line 2:46 (got Ident 'label')
  --> /tmp/dojo-run-length-encoding-3.almd:2:46
  hint: Type names must start with an uppercase letter, e.g. Int, String, MyType
  |
2 |   let encoded = string.chars(s) |> list.fold[label](none, (acc, c) =>
  |                                              ^
error: Expected LBrace at line 3:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-3.almd:3:20
  |
3 |     match (acc, c) with
  |                    ^
error: Expected LBrace at line 14:20 (got Ident 'with')
  --> /tmp/dojo-run-length-encoding-3.almd:14:20
   |
14 |     match (acc, c) with
   |                    ^
error[E003]: undefined variable 'encoded'
  --> /tmp/dojo-run-length-encoding-3.almd:10:13
  in variable encoded
  hint: Check the variable name
   |
10 |   list.join(encoded, "")
   |             ^^^^^^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:13:3
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
   |
13 |   let decoded = string.chars(s) |> list.fold(label, (acc, c) =>
   |   ^^^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
