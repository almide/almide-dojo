# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  let mut prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result += int.to_string(count);
        result += string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result += int.to_string(count);
    result += string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  let mut prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap();
    } else {
      result += string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-run-length-encoding-0.almd:1:36
  here: fn rle_encode(s: String) -> String {
  hint: Almide requires '=' before the body. Write: fn rle_encode(...) -> Type = { ... }
  |
1 | fn rle_encode(s: String) -> String {
  |                                    ^
error: Missing '=' before function body at line 25:36
  --> /tmp/dojo-run-length-encoding-0.almd:25:36
  here: fn rle_decode(s: String) -> String {
  hint: Almide requires '=' before the body. Write: fn rle_decode(...) -> Type = { ... }
   |
25 | fn rle_decode(s: String) -> String {
   |                                    ^

2 error(s) found
FAILED: /tmp/dojo-run-length-encoding-0.almd
  parse error: Missing '=' before function body at line 1:36
  parse error: Missing '=' before function body at line 25:36
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  let mut prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result += int.to_string(count);
        result += string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result += int.to_string(count);
    result += string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  let mut prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap();
    } else {
      result += string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:3:7
  in let mut
  here: let mut result = String::new();
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
3 |   let mut result = String::new();
  |       ^^^
error: '::' is not valid in Almide at line 3:26
  --> /tmp/dojo-run-length-encoding-1.almd:3:26
  here: let mut result = String::new();
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let mut result = String::new();
  |                          ^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:4:7
  in let mut
  here: let mut count = 0;
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
4 |   let mut count = 0;
  |       ^^^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:5:7
  in let mut
  here: let mut prev = None;
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
5 |   let mut prev = None;
  |       ^^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-1.almd:7:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
7 |     if Some(x) == prev {
  |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:8:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       count += 1;
  |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-1.almd:10:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
10 |       if count > 0 {
   |                    ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:11:17
  in assignment-in-expr
  here: result += int.to_string(count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |         result += int.to_string(count);
   |                 ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:12:17
  in assignment-in-expr
  here: result += string.from_codepoint(x);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
12 |         result += string.from_codepoint(x);
   |                 ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-1.almd:18:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
18 |   if count > 0 {
   |                ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:19:13
  in assignment-in-expr
  here: result += int.to_string(count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
19 |     result += int.to_string(count);
   |             ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:20:13
  in assignment-in-expr
  here: result += string.from_codepoint(prev.unwrap());
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |     result += string.from_codepoint(prev.unwrap());
   |             ^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:27:7
  in let mut
  here: let mut result = String::new();
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
   |
27 |   let mut result = String::new();
   |       ^^^
error: '::' is not valid in Almide at line 27:26
  --> /tmp/dojo-run-length-encoding-1.almd:27:26
  here: let mut result = String::new();
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
27 |   let mut result = String::new();
   |                          ^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:28:7
  in let mut
  here: let mut count = 0;
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
   |
28 |   let mut count = 0;
   |       ^^^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:29:7
  in let mut
  here: let mut prev = None;
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
   |
29 |   let mut prev = None;
   |       ^^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-1.almd:31:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
31 |     if x.is_digit(10) {
   |                       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:34:15
  in assignment-in-expr
  here: result += string.repeat(string.from_codepoint(x), count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
34 |       result += string.repeat(string.from_codepoint(x), count);
   |               ^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-run-length-encoding-1.almd:3:20
  in variable String
  here: let mut result = String::new();
  hint: Check the variable name
  |
3 |   let mut result = String::new();
  |                    ^^^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-run-length-encoding-1.almd:27:20
  in variable String
  here: let mut result = String::new();
  hint: Check the variable name
   |
27 |   let mut result = String::new();
   |                    ^^^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-1.almd:31:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
31 |     if x.is_digit(10) {
   |        ^
error[E002]: undefined method 'unwrap' on result
  --> /tmp/dojo-run-length-encoding-1.almd:32:15
  in method call .unwrap()
  here: count = int.parse(x).unwrap();
  hint: Almide doesn't use method-call syntax. Write `result.<fn>(x)` (or `x |> result.<fn>`) — there is no method `unwrap` on `result`. Run `almide explain E002` for examples.
   |
32 |       count = int.parse(x).unwrap();
   |               ^^^^^^^^^^^^^^^^^^^^^

22 error(s) found
FAILED: /tmp/dojo-run-length-encoding-1.almd
  parse error: 'let mut' is not valid in Almide
  parse error: '::' is not valid in Almide at line 3:26
  parse error: 'let mut' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}
```

**Diagnostic:**

```
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-2.almd:7:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
7 |     if Some(x) == prev {
  |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:8:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       count += 1;
  |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-2.almd:10:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
10 |       if count > 0 {
   |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-2.almd:18:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
18 |   if count > 0 {
   |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-2.almd:31:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
31 |     if x.is_digit(10) {
   |                       ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-2.almd:12:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
12 |         result = result + string.from_codepoint(x);
   |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:12:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
   |
12 |         result = result + string.from_codepoint(x);
   |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-2.almd:20:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
20 |     result = result + string.from_codepoint(prev.unwrap());
   |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:20:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
   |
20 |     result = result + string.from_codepoint(prev.unwrap());
   |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-2.almd:31:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
31 |     if x.is_digit(10) {
   |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-2.almd:34:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
34 |       result = result + string.repeat(string.from_codepoint(x), count);
   |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:34:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
34 |       result = result + string.repeat(string.from_codepoint(x), count);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^

12 error(s) found
FAILED: /tmp/dojo-run-length-encoding-2.almd
  parse error: if requires 'then', not a brace block
  parse error: Assignments return Unit and can't appear here
  parse error: if requires 'then', not a brace block
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count > 0 {
    result = result + int.to_string(count);
    result = result + string.from_codepoint(prev.unwrap());
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x).unwrap_or(0);
    } else {
      result = result + string.repeat(string.from_codepoint(x), count);
      count = 0;
      prev = Some(x);
    }
  }
  result
}

fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var prev = None;
  for x in xs {
    if Some(x) == prev {
      count += 1;
    } else {
      if count > 0 {
        result = result + int.to_string(count);
        result = result + string.from_codepoint(x);
      }
      count = 1;
      prev = Some(x);
    }
  }
  if count
```

**Diagnostic:**

```
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:7:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
7 |     if Some(x) == prev {
  |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:8:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       count += 1;
  |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:10:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
10 |       if count > 0 {
   |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:18:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
18 |   if count > 0 {
   |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:31:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
31 |     if x.is_digit(10) {
   |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:48:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
48 |     if Some(x) == prev {
   |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:49:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
49 |       count += 1;
   |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:51:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
51 |       if count > 0 {
   |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:59:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
59 |   if count > 0 {
   |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:72:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
72 |     if x.is_digit(10) {
   |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:89:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
89 |     if Some(x) == prev {
   |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:90:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
90 |       count += 1;
   |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:92:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
92 |       if count > 0 {
   |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:100:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
100 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:113:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
113 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:130:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
130 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:131:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
131 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:133:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
133 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:141:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
141 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:154:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
154 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:171:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
171 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:172:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
172 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:174:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
174 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:182:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
182 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:195:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
195 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:212:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
212 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:213:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
213 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:215:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
215 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:223:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
223 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:236:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
236 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:253:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
253 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:254:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
254 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:256:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
256 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:264:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
264 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:277:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
277 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:294:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
294 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:295:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
295 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:297:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
297 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:305:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
305 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:318:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
318 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:335:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
335 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:336:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
336 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:338:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
338 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:346:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
346 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:359:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
359 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:376:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
376 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:377:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
377 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:379:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
379 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:387:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
387 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:400:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
400 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:417:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
417 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:418:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
418 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:420:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
420 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:428:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
428 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:441:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
441 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:458:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
458 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:459:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
459 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:461:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
461 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:469:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
469 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:482:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
482 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:499:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
499 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:500:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
500 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:502:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
502 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:510:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
510 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:523:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
523 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:540:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
540 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:541:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
541 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:543:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
543 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:551:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
551 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:564:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
564 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:581:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
581 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:582:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
582 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:584:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
584 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:592:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
592 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:605:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
605 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:622:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
622 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:623:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
623 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:625:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
625 |       if count > 0 {
    |                    ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:633:16
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
633 |   if count > 0 {
    |                ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:646:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
646 |     if x.is_digit(10) {
    |                       ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:663:24
  in if
  here: if Some(x) == prev {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
663 |     if Some(x) == prev {
    |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:664:14
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
    |
664 |       count += 1;
    |              ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:666:20
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
    |
666 |       if count > 0 {
    |                    ^
error: if requires 'then' before its branch
  --> /tmp/dojo-run-length-encoding-3.almd:676:1
  in if
  here: test "rle_encode empty" { assert_eq(rle_encode(""), "") }
  hint: Write `if cond then a else b`; the branch may go on the next line after `then`.
  try:
      if x > 0 then 1 else 2
    |
676 | test "rle_encode empty" { assert_eq(rle_encode(""), "") }
    | ^^^^
error[E012]: duplicate function 'rle_encode'
  at line 42
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn rle_encode(s: String) -> String = {
   | ------------------------------------- first definition of 'rle_encode' here
...
42 | fn rle_encode(s: String) -> String = {
   | ^
error[E012]: duplicate function 'rle_decode'
  at line 66
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
25 | fn rle_decode(s: String) -> String = {
   | ------------------------------------- first definition of 'rle_decode' here
...
66 | fn rle_decode(s: String) -> String = {
   | ^
error[E012]: duplicate function 'rle_encode'
  at line 83
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn rle_encode(s: String) -> String = {
   | ------------------------------------- first definition of 'rle_encode' here
...
83 | fn rle_encode(s: String) -> String = {
   | ^
error[E012]: duplicate function 'rle_decode'
  at line 107
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
107 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 124
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
124 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 148
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
148 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 165
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
165 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 189
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
189 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 206
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
206 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 230
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
230 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 247
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
247 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 271
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
271 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 288
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
288 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 312
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
312 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 329
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
329 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 353
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
353 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 370
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
370 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 394
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
394 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 411
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
411 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 435
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
435 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 452
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
452 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 476
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
476 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 493
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
493 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 517
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
517 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 534
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
534 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 558
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
558 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 575
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
575 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 599
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
599 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 616
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
616 | fn rle_encode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_decode'
  at line 640
  in fn rle_decode
  here: fn rle_decode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 25 | fn rle_decode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_decode' here
 ...
640 | fn rle_decode(s: String) -> String = {
    | ^
error[E012]: duplicate function 'rle_encode'
  at line 657
  in fn rle_encode
  here: fn rle_encode(s: String) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn rle_encode(s: String) -> String = {
    | ------------------------------------- first definition of 'rle_encode' here
 ...
657 | fn rle_encode(s: String) -> String = {
    | ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:12:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
12 |         result = result + string.from_codepoint(x);
   |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:12:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
   |
12 |         result = result + string.from_codepoint(x);
   |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:20:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
20 |     result = result + string.from_codepoint(prev.unwrap());
   |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:20:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
   |
20 |     result = result + string.from_codepoint(prev.unwrap());
   |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:31:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
31 |     if x.is_digit(10) {
   |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:34:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
34 |       result = result + string.repeat(string.from_codepoint(x), count);
   |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:34:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
34 |       result = result + string.repeat(string.from_codepoint(x), count);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:53:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
53 |         result = result + string.from_codepoint(x);
   |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:53:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
   |
53 |         result = result + string.from_codepoint(x);
   |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:61:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
61 |     result = result + string.from_codepoint(prev.unwrap());
   |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:61:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
   |
61 |     result = result + string.from_codepoint(prev.unwrap());
   |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:72:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
72 |     if x.is_digit(10) {
   |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:75:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
75 |       result = result + string.repeat(string.from_codepoint(x), count);
   |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:75:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
75 |       result = result + string.repeat(string.from_codepoint(x), count);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:94:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
   |
94 |         result = result + string.from_codepoint(x);
   |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:94:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
   |
94 |         result = result + string.from_codepoint(x);
   |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:102:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
102 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:102:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
102 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:113:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
113 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:116:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
116 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:116:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
116 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:135:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
135 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:135:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
135 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:143:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
143 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:143:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
143 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:154:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
154 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:157:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
157 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:157:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
157 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:176:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
176 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:176:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
176 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:184:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
184 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:184:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
184 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:195:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
195 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:198:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
198 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:198:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
198 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:217:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
217 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:217:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
217 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:225:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
225 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:225:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
225 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:236:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
236 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:239:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
239 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:239:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
239 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:258:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
258 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:258:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
258 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:266:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
266 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:266:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
266 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:277:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
277 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:280:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
280 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:280:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
280 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:299:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
299 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:299:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
299 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:307:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
307 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:307:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
307 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:318:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
318 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:321:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
321 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:321:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
321 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:340:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
340 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:340:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
340 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:348:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
348 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:348:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
348 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:359:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
359 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:362:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
362 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:362:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
362 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:381:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
381 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:381:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
381 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:389:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
389 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:389:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
389 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:400:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
400 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:403:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
403 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:403:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
403 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:422:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
422 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:422:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
422 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:430:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
430 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:430:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
430 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:441:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
441 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:444:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
444 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:444:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
444 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:463:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
463 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:463:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
463 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:471:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
471 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:471:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
471 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:482:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
482 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:485:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
485 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:485:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
485 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:504:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
504 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:504:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
504 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:512:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
512 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:512:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
512 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:523:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
523 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:526:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
526 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:526:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
526 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:545:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
545 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:545:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
545 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:553:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
553 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:553:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
553 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:564:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
564 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:567:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
567 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:567:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
567 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:586:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
586 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:586:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
586 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:594:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
594 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:594:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
594 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:605:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
605 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:608:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
608 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:608:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
608 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:627:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
627 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:627:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
627 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:635:45
  in method call .unwrap()
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
    |
635 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:635:45
  in operator +
  here: result = result + string.from_codepoint(prev.unwrap());
  hint: Use + with numeric types, String, List, or Bytes
    |
635 |     result = result + string.from_codepoint(prev.unwrap());
    |                                             ^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:646:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
    |
646 |     if x.is_digit(10) {
    |        ^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:649:61
  in call to string.from_codepoint()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
649 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                                             ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:649:39
  in call to string.repeat()
  here: result = result + string.repeat(string.from_codepoint(x), count);
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
649 |       result = result + string.repeat(string.from_codepoint(x), count);
    |                                       ^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:668:49
  in call to string.from_codepoint()
  here: result = result + string.from_codepoint(x);
  hint: Fix the argument type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  try:
      // Try:
      int.parse(x)
    |
668 |         result = result + string.from_codepoint(x);
    |                                                 ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:668:49
  in operator +
  here: result = result + string.from_codepoint(x);
  hint: Use + with numeric types, String, List, or Bytes
    |
668 |         result = result + string.from_codepoint(x);
    |                                                 ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:671:19
  in fn 'rle_encode'
  here: prev = Some(x);
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
    |
671 |       prev = Some(x);
    |                   ^

230 error(s) found
FAILED: /tmp/dojo-run-length-encoding-3.almd
  parse error: if requires 'then', not a brace block
  parse error: Assignments return Unit and can't appear here
  parse error: if requires 'then', not a brace block
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
