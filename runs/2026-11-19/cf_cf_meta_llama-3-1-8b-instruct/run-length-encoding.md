# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  for x in xs {
    if count > 0 {
      result += int.to_string(count);
      result += string.from_codepoint(x);
      count = 0;
    }
    count += 1;
  }
  if count > 0 {
    result += int.to_string(count);
    result += string.from_codepoint(xs.last().unwrap());
  }
  result
}

fn rle_decode(s: String) -> String {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  let mut char = '';
  for x in xs {
    if x.is_digit(10) {
      count = int.parse(x.to_string()).unwrap();
    } else {
      char = x;
      result += string.repeat(char, count);
      count = 0;
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
error: Missing '=' before function body at line 20:36
  --> /tmp/dojo-run-length-encoding-0.almd:20:36
  here: fn rle_decode(s: String) -> String {
  hint: Almide requires '=' before the body. Write: fn rle_decode(...) -> Type = { ... }
   |
20 | fn rle_decode(s: String) -> String {
   |                                    ^

2 error(s) found
FAILED: /tmp/dojo-run-length-encoding-0.almd
  parse error: Missing '=' before function body at line 1:36
  parse error: Missing '=' before function body at line 20:36
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
  for x in xs {
    if count > 0 {
      result += int.to_string(count);
      result += string.from_codepoint(x);
      count = 0;
    }
    count += 1;
  }
  if count > 0 {
    result += int.to_string(count);
    result += string.from_codepoint(xs.last() ?? "");
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  let mut result = String::new();
  let mut count = 0;
  let mut char = '';
  for x in xs {
    if x.is_digit(10) {
      match int.parse(x.to_string()) {
        ok(n) => count = n,
        err(_) => count = 0
      }
    } else {
      char = x;
      result += string.repeat(char, count);
      count = 0;
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
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-1.almd:6:18
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
6 |     if count > 0 {
  |                  ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:7:15
  in assignment-in-expr
  here: result += int.to_string(count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       result += int.to_string(count);
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:8:15
  in assignment-in-expr
  here: result += string.from_codepoint(x);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       result += string.from_codepoint(x);
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:11:12
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     count += 1;
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got If 'if')
  --> /tmp/dojo-run-length-encoding-1.almd:13:3
  here: if count > 0 {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   if count > 0 {
   |   ^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:22:7
  in let mut
  here: let mut result = String::new();
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
   |
22 |   let mut result = String::new();
   |       ^^^
error: '::' is not valid in Almide at line 22:26
  --> /tmp/dojo-run-length-encoding-1.almd:22:26
  here: let mut result = String::new();
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
22 |   let mut result = String::new();
   |                          ^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:23:7
  in let mut
  here: let mut count = 0;
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
   |
23 |   let mut count = 0;
   |       ^^^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:24:7
  in let mut
  here: let mut char = '';
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
   |
24 |   let mut char = '';
   |       ^^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-1.almd:26:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
26 |     if x.is_digit(10) {
   |                       ^
error: Expected pattern at line 28:24 (got Eq '=')
  --> /tmp/dojo-run-length-encoding-1.almd:28:24
  here: ok(n) => count = n,
  hint: assignment is a statement, not an expression — a match arm that assigns needs a block body:
    ok(_) => { c = c + 1 }
   |
28 |         ok(n) => count = n,
   |                        ^
error: Expected expression at line 31:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:31:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |     } else {
   |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:33:15
  in assignment-in-expr
  here: result += string.repeat(char, count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
33 |       result += string.repeat(char, count);
   |               ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 36:3 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-1.almd:36:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   }
   |   ^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-run-length-encoding-1.almd:3:20
  in variable String
  here: let mut result = String::new();
  hint: Check the variable name
  |
3 |   let mut result = String::new();
  |                    ^^^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-run-length-encoding-1.almd:22:20
  in variable String
  here: let mut result = String::new();
  hint: Check the variable name
   |
22 |   let mut result = String::new();
   |                    ^^^^^^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-1.almd:26:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
26 |     if x.is_digit(10) {
   |        ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-run-length-encoding-1.almd:32:14
  in variable x
  here: char = x;
  hint: Did you mean `s`?
  try:
      s
   |
32 |       char = x;
   |              ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:4:19
  in fn 'rle_encode'
  here: let mut count = 0;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let mut count = 0;
  |                   ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:34:15
  in fn 'rle_decode'
  here: count = 0;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
34 |       count = 0;
   |               ^

23 error(s) found
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
  for x in xs {
    if count > 0 {
      result += int.to_string(count);
      result += string.from_codepoint(x);
      count = 0;
    }
    count += 1;
  }
  if count > 0 {
    result += int.to_string(count);
    result += string.from_codepoint(xs.last() ?? "");
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  var result = "";
  var count = 0;
  var char = '';
  for x in xs {
    if x.is_digit(10) {
      match int.parse(x.to_string()) {
        ok(n) => count = n,
        err(_) => count = 0
      }
    } else {
      char = x;
      result += string.repeat(char, count);
      count = 0;
    }
  }
  result
}
```

**Diagnostic:**

```
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-2.almd:6:18
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
6 |     if count > 0 {
  |                  ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:7:15
  in assignment-in-expr
  here: result += int.to_string(count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       result += int.to_string(count);
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:8:15
  in assignment-in-expr
  here: result += string.from_codepoint(x);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       result += string.from_codepoint(x);
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:11:12
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     count += 1;
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got If 'if')
  --> /tmp/dojo-run-length-encoding-2.almd:13:3
  here: if count > 0 {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   if count > 0 {
   |   ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-2.almd:26:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
26 |     if x.is_digit(10) {
   |                       ^
error: Expected pattern at line 28:24 (got Eq '=')
  --> /tmp/dojo-run-length-encoding-2.almd:28:24
  here: ok(n) => count = n,
  hint: assignment is a statement, not an expression — a match arm that assigns needs a block body:
    ok(_) => { c = c + 1 }
   |
28 |         ok(n) => count = n,
   |                        ^
error: Expected expression at line 31:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:31:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |     } else {
   |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:33:15
  in assignment-in-expr
  here: result += string.repeat(char, count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
33 |       result += string.repeat(char, count);
   |               ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 36:3 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-2.almd:36:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   }
   |   ^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-2.almd:26:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
26 |     if x.is_digit(10) {
   |        ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-run-length-encoding-2.almd:32:14
  in variable x
  here: char = x;
  hint: Did you mean `s`?
  try:
      s
   |
32 |       char = x;
   |              ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:4:15
  in fn 'rle_encode'
  here: var count = 0;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   var count = 0;
  |               ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:34:15
  in fn 'rle_decode'
  here: count = 0;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
34 |       count = 0;
   |               ^

14 error(s) found
FAILED: /tmp/dojo-run-length-encoding-2.almd
  parse error: if requires 'then', not a brace block
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.to_list(s);
  let result = "";
  let count = 0;
  for x in xs {
    if count > 0 {
      result += int.to_string(count);
      result += string.from_codepoint(x);
      count = 0;
    }
    count += 1;
  }
  if count > 0 {
    result += int.to_string(count);
    result += string.from_codepoint(xs.last() ?? "");
  }
  result
}

fn rle_decode(s: String) -> String = {
  let xs = string.to_list(s);
  let result = "";
  let count = 0;
  let char = '';
  for x in xs {
    if x.is_digit(10) {
      match int.parse(x.to_string()) {
        ok(n) => {
          count = n;
        },
        err(_) => {
          count = 0;
        }
      }
    } else {
      char = x;
      result += string.repeat(char, count);
      count = 0;
    }
  }
  result
}
```

**Diagnostic:**

```
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:6:18
  in if
  here: if count > 0 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
6 |     if count > 0 {
  |                  ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:7:15
  in assignment-in-expr
  here: result += int.to_string(count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       result += int.to_string(count);
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:8:15
  in assignment-in-expr
  here: result += string.from_codepoint(x);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       result += string.from_codepoint(x);
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:11:12
  in assignment-in-expr
  here: count += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     count += 1;
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got If 'if')
  --> /tmp/dojo-run-length-encoding-3.almd:13:3
  here: if count > 0 {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   if count > 0 {
   |   ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-run-length-encoding-3.almd:26:23
  in if
  here: if x.is_digit(10) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
26 |     if x.is_digit(10) {
   |                       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:37:15
  in assignment-in-expr
  here: result += string.repeat(char, count);
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
37 |       result += string.repeat(char, count);
   |               ^
error[E004]: string.is_digit() expects 1 argument(s) but got 2
  --> /tmp/dojo-run-length-encoding-3.almd:26:8
  in call to string.is_digit()
  here: if x.is_digit(10) {
  hint: Check the number of arguments
  try:
      // string.is_digit() takes 1 arg(s) — you passed 2
      string.is_digit(<s: String>)
   |
26 |     if x.is_digit(10) {
   |        ^
error[E002]: undefined method 'to_string' on string
  --> /tmp/dojo-run-length-encoding-3.almd:27:23
  in method call .to_string()
  here: match int.parse(x.to_string()) {
  hint: Almide doesn't use method-call syntax. Write `string.<fn>(x)` (or `x |> string.<fn>`) — there is no method `to_string` on `string`. Run `almide explain E002` for examples.
   |
27 |       match int.parse(x.to_string()) {
   |                       ^^^^^^^^^^^^^
error[E009]: cannot reassign immutable binding 'count'
  --> /tmp/dojo-run-length-encoding-3.almd:29:19
  in count = ...
  here: count = n;
  hint: Use 'var count = ...' instead of 'let count = ...' to declare a mutable variable
  try:
      // let count = ...  →  var count = ...
      var count = <initial value>
   |
23 |   let count = 0;
   |   --------------------- 'count' declared here
...
29 |           count = n;
   |                   ^
error[E009]: cannot reassign immutable binding 'count'
  --> /tmp/dojo-run-length-encoding-3.almd:32:19
  in count = ...
  here: count = 0;
  hint: Use 'var count = ...' instead of 'let count = ...' to declare a mutable variable
  try:
      // let count = ...  →  var count = ...
      var count = <initial value>
   |
23 |   let count = 0;
   |   --------------------- 'count' declared here
...
32 |           count = 0;
   |                   ^
error[E009]: cannot reassign immutable binding 'char'
  --> /tmp/dojo-run-length-encoding-3.almd:36:14
  in char = ...
  here: char = x;
  hint: Use 'var char = ...' instead of 'let char = ...' to declare a mutable variable
  try:
      // let char = ...  →  var char = ...
      var char = <initial value>
   |
24 |   let char = '';
   |   -------------------- 'char' declared here
...
36 |       char = x;
   |              ^
error[E009]: cannot reassign immutable binding 'count'
  --> /tmp/dojo-run-length-encoding-3.almd:38:15
  in count = ...
  here: count = 0;
  hint: Use 'var count = ...' instead of 'let count = ...' to declare a mutable variable
  try:
      // let count = ...  →  var count = ...
      var count = <initial value>
   |
23 |   let count = 0;
   |   --------------------- 'count' declared here
...
38 |       count = 0;
   |               ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:4:15
  in fn 'rle_encode'
  here: let count = 0;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let count = 0;
  |               ^

14 error(s) found
FAILED: /tmp/dojo-run-length-encoding-3.almd
  parse error: if requires 'then', not a brace block
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
