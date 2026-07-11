# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
    let mut result = String::new();
    let mut count = 0;
    for c in string.chars(s) {
        if count > 0 {
            result = result + int.to_string(count) + c;
            count = 0;
        } else {
            count += 1;
        }
    }
    result
}

fn rle_decode(s: String) -> String {
    let mut result = String::new();
    let mut i = 0;
    while i < string.len(s) {
        let count = int.parse(string.take(s, i + 1, i + 2));
        match count {
            ok(count) => {
                result = result + string.take(s, i + 2, i + count + 2);
                i += count + 2;
            }
            err(_) => {
                result = result + string.take(s, i + 1, i + 2);
                i += 2;
            }
        }
    }
    result
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
error: Missing '=' before function body at line 15:36
  --> /tmp/dojo-run-length-encoding-0.almd:15:36
  hint: Almide requires '=' before the body. Write: fn rle_decode(...) -> Type = { ... }
   |
15 | fn rle_decode(s: String) -> String {
   |                                    ^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
    let mut result = String::new();
    let mut count = 0;
    for c in string.chars(s) {
        if count > 0 {
            result = result + int.to_string(count) + c;
            count = 0;
        } else {
            count += 1;
        }
    }
    if count > 0 {
        result = result + int.to_string(count);
    }
    result
}

fn rle_decode(s: String) -> String = {
    let mut result = String::new();
    let mut i = 0;
    while i < string.len(s) {
        let count = int.parse(string.take(s, i + 1, i + 2));
        match count {
            ok(count) => {
                result = result + string.take(s, i + 2, i + count + 2);
                i += count + 2;
            }
            err(_) => {
                result = result + string.take(s, i + 1, i + 2);
                i += 2;
            }
        }
    }
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let mut' is not valid in Almide at line 2:9
  --> /tmp/dojo-run-length-encoding-1.almd:2:9
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |     let mut result = String::new();
  |         ^
error: 'let mut' is not valid in Almide at line 3:9
  --> /tmp/dojo-run-length-encoding-1.almd:3:9
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |     let mut count = 0;
  |         ^
error: Expected Then at line 5:22 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:5:22
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |         if count > 0 {
  |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:11 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:8:11
  |
8 |         } else {
  |           ^
error: 'let mut' is not valid in Almide at line 19:9
  --> /tmp/dojo-run-length-encoding-1.almd:19:9
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
19 |     let mut result = String::new();
   |         ^
error: 'let mut' is not valid in Almide at line 20:9
  --> /tmp/dojo-run-length-encoding-1.almd:20:9
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
20 |     let mut i = 0;
   |         ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:26:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
26 |                 i += count + 2;
   |                    ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:30:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
30 |                 i += 2;
   |                    ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-run-length-encoding-1.almd:6:22
  in variable result
  hint: Check the variable name
  |
6 |             result = result + int.to_string(count) + c;
  |                      ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-1.almd:6:45
  in variable count
  hint: Check the variable name
  |
6 |             result = result + int.to_string(count) + c;
  |                                             ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-1.almd:6:54
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:21:11
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
21 |     while i < string.len(s) {
   |           ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:22:46
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
22 |         let count = int.parse(string.take(s, i + 1, i + 2));
   |                                              ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:22:53
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
22 |         let count = int.parse(string.take(s, i + 1, i + 2));
   |                                                     ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-1.almd:22:57
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
22 |         let count = int.parse(string.take(s, i + 1, i + 2));
   |                                                         ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-run-length-encoding-1.almd:25:26
  in variable result
  hint: Check the variable name
   |
25 |                 result = result + string.take(s, i + 2, i + count + 2);
   |                          ^^^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:25:50
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
25 |                 result = result + string.take(s, i + 2, i + count + 2);
   |                                                  ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:25:57
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
25 |                 result = result + string.take(s, i + 2, i + count + 2);
   |                                                         ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-1.almd:25:69
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
25 |                 result = result + string.take(s, i + 2, i + count + 2);
   |                                                                     ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-run-length-encoding-1.almd:29:26
  in variable result
  hint: Check the variable name
   |
29 |                 result = result + string.take(s, i + 1, i + 2);
   |                          ^^^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:29:50
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
29 |                 result = result + string.take(s, i + 1, i + 2);
   |                                                  ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:29:57
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
29 |                 result = result + string.take(s, i + 1, i + 2);
   |                                                         ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-1.almd:29:61
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
29 |                 result = result + string.take(s, i + 1, i + 2);
   |                                                             ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-run-length-encoding-1.almd:34:5
  in variable result
  hint: Check the variable name
   |
34 |     result
   |     ^^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:7:21
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |             count = 0;
  |                     ^

25 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
    let result = String::new();
    let count = 0;
    for c in string.chars(s) {
        if count > 0 {
            result = result + int.to_string(count) + c;
            count = 0;
        } else {
            count += 1;
        }
    }
    if count > 0 {
        result = result + int.to_string(count);
    }
    result
}

fn rle_decode(s: String) -> String = {
    let result = String::new();
    let i = 0;
    while i < string.len(s) {
        let count_str = string.take(s, i + 1, i + 2);
        let count = int.parse(count_str);
        match count {
            ok(count) => {
                let char = string.take(s, i + 2, i + count + 2);
                result = result + char;
                i += count + 2;
            }
            err(_) => {
                let char = string.take(s, i + 1, i + 2);
                result = result + char;
                i += 2;
            }
        }
    }
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: '::' is not valid in Almide at line 2:24
  --> /tmp/dojo-run-length-encoding-2.almd:2:24
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
2 |     let result = String::new();
  |                        ^
error: Expected Then at line 5:22 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:5:22
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |         if count > 0 {
  |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:11 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:8:11
  |
8 |         } else {
  |           ^
error: '::' is not valid in Almide at line 19:24
  --> /tmp/dojo-run-length-encoding-2.almd:19:24
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
19 |     let result = String::new();
   |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:28:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
28 |                 i += count + 2;
   |                    ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:33:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
33 |                 i += 2;
   |                    ^
error: operator '+' requires numeric, String, or List types but got String and String
  --> /tmp/dojo-run-length-encoding-2.almd:6:45
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |             result = result + int.to_string(count) + c;
  |                                             ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-2.almd:6:54
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error: operator '+' requires numeric, String, or List types but got String and Unknown
  --> /tmp/dojo-run-length-encoding-2.almd:6:54
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-run-length-encoding-2.almd:6:54
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
  |
2 |     let result = String::new();
  |     ---------------------- 'result' declared here
...
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error[E009]: cannot reassign immutable binding 'count'
  --> /tmp/dojo-run-length-encoding-2.almd:7:21
  in count = ...
  hint: Use 'var count = ...' instead of 'let count = ...' to declare a mutable variable
  try:
      // let count = ...  →  var count = ...
      var count = <initial value>
  |
3 |     let count = 0;
  |     --------------------- 'count' declared here
...
7 |             count = 0;
  |                     ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-2.almd:22:51
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
22 |         let count_str = string.take(s, i + 1, i + 2);
   |                                                   ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-2.almd:26:62
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
26 |                 let char = string.take(s, i + 2, i + count + 2);
   |                                                              ^
error: operator '+' requires numeric, String, or List types but got String and String
  --> /tmp/dojo-run-length-encoding-2.almd:27:35
  in operator +
  hint: Use + with numeric types, String, or List
   |
27 |                 result = result + char;
   |                                   ^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-run-length-encoding-2.almd:27:35
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
19 |     let result = String::new();
   |     ---------------------- 'result' declared here
...
27 |                 result = result + char;
   |                                   ^^^^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-2.almd:31:54
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
31 |                 let char = string.take(s, i + 1, i + 2);
   |                                                      ^
error: operator '+' requires numeric, String, or List types but got String and String
  --> /tmp/dojo-run-length-encoding-2.almd:32:35
  in operator +
  hint: Use + with numeric types, String, or List
   |
32 |                 result = result + char;
   |                                   ^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-run-length-encoding-2.almd:32:35
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
19 |     let result = String::new();
   |     ---------------------- 'result' declared here
...
32 |                 result = result + char;
   |                                   ^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:7:21
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |             count = 0;
  |                     ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got String
  --> /tmp/dojo-run-length-encoding-2.almd:37:5
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
   |
37 |     result
   |     ^^^^^^

20 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
    let result = String::new();
    var count = 0;
    for c in string.chars(s) {
        if count > 0 {
            result = result + int.to_string(count) + c;
            count = 0;
        } else {
            count += 1;
        }
    }
    if count > 0 {
        result = result + int.to_string(count) + string.last(s);
    }
    result
}

fn rle_decode(s: String) -> String = {
    let result = String::new();
    var i = 0;
    while i < string.len(s) {
        let count_str = string.take(s, i, i + 2);
        let count = int.parse(count_str);
        match count {
            ok(count) => {
                let char = string.take(s, i + 2, i + count + 2);
                result = result + string.repeat(char, count);
                i += count + 2;
            }
            err(_) => {
                let char = string.take(s, i, i + 2);
                result = result + char;
                i += 2;
            }
        }
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: '::' is not valid in Almide at line 2:24
  --> /tmp/dojo-run-length-encoding-3.almd:2:24
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
2 |     let result = String::new();
  |                        ^
error: Expected Then at line 5:22 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:5:22
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |         if count > 0 {
  |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:11 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-3.almd:8:11
  |
8 |         } else {
  |           ^
error: '::' is not valid in Almide at line 19:24
  --> /tmp/dojo-run-length-encoding-3.almd:19:24
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
19 |     let result = String::new();
   |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:28:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
28 |                 i += count + 2;
   |                    ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-3.almd:33:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
33 |                 i += 2;
   |                    ^
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-run-length-encoding-3.almd:38:1
   |
38 | test "rle_encode empty" { assert_eq(rle_encode(""), "") }
   | ^
error: operator '+' requires numeric, String, or List types but got String and String
  --> /tmp/dojo-run-length-encoding-3.almd:6:45
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |             result = result + int.to_string(count) + c;
  |                                             ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-3.almd:6:54
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error: operator '+' requires numeric, String, or List types but got String and Unknown
  --> /tmp/dojo-run-length-encoding-3.almd:6:54
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-run-length-encoding-3.almd:6:54
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
  |
2 |     let result = String::new();
  |     ---------------------- 'result' declared here
...
6 |             result = result + int.to_string(count) + c;
  |                                                      ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-3.almd:22:47
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
22 |         let count_str = string.take(s, i, i + 2);
   |                                               ^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-3.almd:26:62
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
26 |                 let char = string.take(s, i + 2, i + count + 2);
   |                                                              ^
error: operator '+' requires numeric, String, or List types but got String and String
  --> /tmp/dojo-run-length-encoding-3.almd:27:55
  in operator +
  hint: Use + with numeric types, String, or List
   |
27 |                 result = result + string.repeat(char, count);
   |                                                       ^^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-run-length-encoding-3.almd:27:55
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
19 |     let result = String::new();
   |     ---------------------- 'result' declared here
...
27 |                 result = result + string.repeat(char, count);
   |                                                       ^^^^^
error[E004]: string.take() expects 2 argument(s) but got 3
  --> /tmp/dojo-run-length-encoding-3.almd:31:50
  in call to string.take()
  hint: Check the number of arguments
  try:
      // string.take() takes 2 arg(s) — you passed 3
      string.take(<s: String>, <n: Int>)
   |
31 |                 let char = string.take(s, i, i + 2);
   |                                                  ^
error: operator '+' requires numeric, String, or List types but got String and String
  --> /tmp/dojo-run-length-encoding-3.almd:32:35
  in operator +
  hint: Use + with numeric types, String, or List
   |
32 |                 result = result + char;
   |                                   ^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-run-length-encoding-3.almd:32:35
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
19 |     let result = String::new();
   |     ---------------------- 'result' declared here
...
32 |                 result = result + char;
   |                                   ^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:7:21
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |             count = 0;
  |                     ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:32:35
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
32 |                 result = result + char;
   |                                   ^^^^

20 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
