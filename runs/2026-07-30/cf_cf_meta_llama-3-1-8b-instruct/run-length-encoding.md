# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.chars(s)
  let (acc, prev) = (string.new(), string.new())
  for c in xs {
    if prev.is_empty() || c != string.first(prev) {
      if not prev.is_empty() {
        acc += string.join([prev, int.to_string(string.len(prev))], "")
      }
      prev = string.new()
    }
    prev += c
  }
  if not prev.is_empty() {
    acc += string.join([prev, int.to_string(string.len(prev))], "")
  }
  acc
}

fn rle_decode(s: String) -> String = {
  let xs = string.chars(s)
  let (acc, n) = (string.new(), string.new())
  for c in xs {
    if int.parse(n).is_ok() {
      acc += string.repeat(string.from_codepoint(int.to_int(string.parse(n).unwrap())), int.to_int(string.parse(n).unwrap()))
      n = string.new()
    }
    if c.is_digit() {
      n += c
    } else {
      acc += c
      n = string.new()
    }
  }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: '||' is not valid in Almide at line 5:24
  --> /tmp/dojo-run-length-encoding-0.almd:5:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
5 |     if prev.is_empty() || c != string.first(prev) {
  |                        ^
error: Expected Then at line 6:30 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-0.almd:6:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |       if not prev.is_empty() {
  |                              ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-0.almd:7:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |         acc += string.join([prev, int.to_string(string.len(prev))], "")
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:7 (got Ident 'prev')
  --> /tmp/dojo-run-length-encoding-0.almd:9:7
  |
9 |       prev = string.new()
  |       ^
error: Expected Then at line 23:29 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-0.almd:23:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
23 |     if int.parse(n).is_ok() {
   |                             ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-0.almd:24:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
24 |       acc += string.repeat(string.from_codepoint(int.to_int(string.parse(n).unwrap())), int.to_int(string.parse(n).unwrap()))
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got If 'if')
  --> /tmp/dojo-run-length-encoding-0.almd:27:5
   |
27 |     if c.is_digit() {
   |     ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-0.almd:3:32
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   let (acc, prev) = (string.new(), string.new())
  |                                ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-0.almd:3:46
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   let (acc, prev) = (string.new(), string.new())
  |                                              ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-0.almd:21:29
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
21 |   let (acc, n) = (string.new(), string.new())
   |                             ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-0.almd:21:43
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
21 |   let (acc, n) = (string.new(), string.new())
   |                                           ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-0.almd:25:21
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
25 |       n = string.new()
   |                     ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-run-length-encoding-0.almd:25:21
  in n = ...
  hint: Use 'var n = ...' instead of 'let n = ...' to declare a mutable variable
  try:
      // let n = ...  →  var n = ...
      var n = <initial value>
   |
25 |       n = string.new()
   |                     ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:3:46
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let (acc, prev) = (string.new(), string.new())
  |                                              ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:25:21
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |       n = string.new()
   |                     ^

15 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.chars(s)
  let acc = string.new()
  let prev = string.new()
  for c in xs {
    if prev.is_empty() || c != string.first(prev) {
      if not prev.is_empty() {
        acc += string.join([prev, int.to_string(string.len(prev))], "")
      }
      prev = string.new()
    }
    prev += c
  }
  if not prev.is_empty() {
    acc += string.join([prev, int.to_string(string.len(prev))], "")
  }
  acc
}

fn rle_decode(s: String) -> String = {
  let xs = string.chars(s)
  let acc = string.new()
  let n = string.new()
  for c in xs {
    if int.parse(n).is_ok() {
      acc += string.repeat(string.from_codepoint(int.to_int(string.parse(n).unwrap())), int.to_int(string.parse(n).unwrap()))
      n = string.new()
    }
    if c.is_digit() {
      n += c
    } else {
      acc += c
      n = string.new()
    }
  }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: '||' is not valid in Almide at line 6:24
  --> /tmp/dojo-run-length-encoding-1.almd:6:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |     if prev.is_empty() || c != string.first(prev) {
  |                        ^
error: Expected Then at line 7:30 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:7:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |       if not prev.is_empty() {
  |                              ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:8:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |         acc += string.join([prev, int.to_string(string.len(prev))], "")
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Ident 'prev')
  --> /tmp/dojo-run-length-encoding-1.almd:10:7
   |
10 |       prev = string.new()
   |       ^
error: Expected Then at line 25:29 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:25:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
25 |     if int.parse(n).is_ok() {
   |                             ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:26:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
26 |       acc += string.repeat(string.from_codepoint(int.to_int(string.parse(n).unwrap())), int.to_int(string.parse(n).unwrap()))
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 29:5 (got If 'if')
  --> /tmp/dojo-run-length-encoding-1.almd:29:5
   |
29 |     if c.is_digit() {
   |     ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-1.almd:3:23
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   let acc = string.new()
  |                       ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-1.almd:4:24
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
4 |   let prev = string.new()
  |                        ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-1.almd:22:23
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
22 |   let acc = string.new()
   |                       ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-1.almd:23:21
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
23 |   let n = string.new()
   |                     ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-1.almd:27:21
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
27 |       n = string.new()
   |                     ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-run-length-encoding-1.almd:27:21
  in n = ...
  hint: Use 'var n = ...' instead of 'let n = ...' to declare a mutable variable
  try:
      // let n = ...  →  var n = ...
      var n = <initial value>
   |
23 |   let n = string.new()
   |   ----------------- 'n' declared here
...
27 |       n = string.new()
   |                     ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:4:24
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let prev = string.new()
  |                        ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:27:21
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
27 |       n = string.new()
   |                     ^

15 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.chars(s)
  let acc = string.new()
  for c in xs {
    if string.first(acc) == c {
      let count = int.to_int(string.parse(string.last(acc).unwrap()).unwrap())
      acc = string.join([acc, int.to_string(int.to_int(string.parse(string.last(acc).unwrap()).unwrap()) + 1)], "")
    } else {
      acc += string.join([string.repeat(c, 1), int.to_string(1)], "")
    }
  }
  acc
}

fn rle_decode(s: String) -> String = {
  let xs = string.chars(s)
  let acc = string.new()
  var n = string.new()
  for c in xs {
    if c.is_digit() {
      n += c
    } else {
      acc += string.repeat(string.from_codepoint(int.to_int(string.parse(n).unwrap())), int.to_int(string.parse(n).unwrap()))
      n = string.new()
      acc += c
    }
  }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected Then at line 5:31 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:5:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if string.first(acc) == c {
  |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:8:7
  |
8 |     } else {
  |       ^
error: Expected Then at line 20:21 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:20:21
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |     if c.is_digit() {
   |                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n += c
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:22:7
   |
22 |     } else {
   |       ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-2.almd:3:23
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   let acc = string.new()
  |                       ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-2.almd:6:55
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
6 |       let count = int.to_int(string.parse(string.last(acc).unwrap()).unwrap())
  |                                                       ^^^
error[E002]: undefined function 'string.parse'
  --> /tmp/dojo-run-length-encoding-2.almd:6:55
  in call to string.parse()
  hint: No function 'parse' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
6 |       let count = int.to_int(string.parse(string.last(acc).unwrap()).unwrap())
  |                                                       ^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-run-length-encoding-2.almd:6:55
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       let count = int.to_int(string.parse(string.last(acc).unwrap()).unwrap())
  |                                                       ^^^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-2.almd:7:81
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
7 |       acc = string.join([acc, int.to_string(int.to_int(string.parse(string.last(acc).unwrap()).unwrap()) + 1)], "")
  |                                                                                 ^^^
error[E002]: undefined function 'string.parse'
  --> /tmp/dojo-run-length-encoding-2.almd:7:81
  in call to string.parse()
  hint: No function 'parse' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |       acc = string.join([acc, int.to_string(int.to_int(string.parse(string.last(acc).unwrap()).unwrap()) + 1)], "")
  |                                                                                 ^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-run-length-encoding-2.almd:7:81
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
7 |       acc = string.join([acc, int.to_string(int.to_int(string.parse(string.last(acc).unwrap()).unwrap()) + 1)], "")
  |                                                                                 ^^^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-run-length-encoding-2.almd:7:113
  in acc = ...
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
3 |   let acc = string.new()
  |   ------------------- 'acc' declared here
...
7 |       acc = string.join([acc, int.to_string(int.to_int(string.parse(string.last(acc).unwrap()).unwrap()) + 1)], "")
  |                                                                                                                 ^^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-2.almd:17:23
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
17 |   let acc = string.new()
   |                       ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-2.almd:18:21
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
18 |   var n = string.new()
   |                     ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:7:113
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |       acc = string.join([acc, int.to_string(int.to_int(string.parse(string.last(acc).unwrap()).unwrap()) + 1)], "")
  |                                                                                                                 ^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:18:21
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |   var n = string.new()
   |                     ^

17 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let xs = string.chars(s)
  let acc = string.new()
  for c in xs {
    if string.first(acc) == c {
      let count = string.parse(string.last(acc)).unwrap_or("1")
      acc = string.join([acc, int.to_string(int.parse(count).unwrap_or(1) + 1)], "")
    } else {
      acc = string.join([acc, string.repeat(c, 1), int.to_string(1)], "")
    }
  }
  acc
}

fn rle_decode(s: String) -> String = {
  let xs = string.chars(s)
  let acc = string.new()
  var n = string.new()
  for c in xs {
    if c.is_digit() {
      n += c
    } else {
      acc = string.join([acc, string.repeat(string.from_codepoint(int.parse(n).unwrap_or(0)), int.parse(n).unwrap_or(0))], "")
      n = string.new()
      acc += c
    }
  }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: Expected Then at line 5:31 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:5:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if string.first(acc) == c {
  |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-3.almd:8:7
  |
8 |     } else {
  |       ^
error: Expected Then at line 20:21 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:20:21
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |     if c.is_digit() {
   |                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n += c
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-3.almd:22:7
   |
22 |     } else {
   |       ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-3.almd:3:23
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   let acc = string.new()
  |                       ^
error[E002]: undefined function 'string.parse'
  --> /tmp/dojo-run-length-encoding-3.almd:6:44
  in call to string.parse()
  hint: No function 'parse' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
6 |       let count = string.parse(string.last(acc)).unwrap_or("1")
  |                                            ^^^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-run-length-encoding-3.almd:7:82
  in acc = ...
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
3 |   let acc = string.new()
  |   ------------------- 'acc' declared here
...
7 |       acc = string.join([acc, int.to_string(int.parse(count).unwrap_or(1) + 1)], "")
  |                                                                                  ^^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-3.almd:17:23
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
17 |   let acc = string.new()
   |                       ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-run-length-encoding-3.almd:18:21
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
18 |   var n = string.new()
   |                     ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:7:82
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |       acc = string.join([acc, int.to_string(int.parse(count).unwrap_or(1) + 1)], "")
  |                                                                                  ^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:18:21
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |   var n = string.new()
   |                     ^

12 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
