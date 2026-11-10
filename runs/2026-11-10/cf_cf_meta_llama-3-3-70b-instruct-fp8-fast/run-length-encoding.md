# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_empty(acc) then "1" + c 
    else let last = string.last(acc) ?? ""
         in if last == c then 
              let count = int.parse(string.drop_end(acc, 1)) ?? 1
              in int.to_string(count + 1) + c
            else acc + "1" + c
  )

fn rle_decode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_digit(c) then 
      let count = int.parse(c) ?? 1
      in let next = list.first(string.drop(acc, 1)) ?? ""
         in acc + string.repeat(next, count - 1)
    else acc + c
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:5:10
  in let-in
  here: else let last = string.last(acc) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     else let last = string.last(acc) ?? ""
  |          ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:7:15
  in let-in
  here: let count = int.parse(string.drop_end(acc, 1)) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |               let count = int.parse(string.drop_end(acc, 1)) ?? 1
  |               ^^^
error: Expected expression at line 9:13 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-0.almd:9:13
  here: else acc + "1" + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |             else acc + "1" + c
  |             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:16:7
  in let-in
  here: let count = int.parse(c) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |       let count = int.parse(c) ?? 1
   |       ^^^
error: Expected expression at line 19:5 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-0.almd:19:5
  here: else acc + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |     else acc + c
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-0.almd:8:29
  in variable count
  here: int.to_string(count + 1) + c
  hint: Did you mean `map.count`?
  try:
      map.count
  |
8 |               int.to_string(count + 1) + c
  |                             ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-0.almd:8:42
  in variable c
  here: int.to_string(count + 1) + c
  hint: Did you mean `s`?
  try:
      s
  |
8 |               int.to_string(count + 1) + c
  |                                          ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-0.almd:17:41
  in variable acc
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Check the variable name
   |
17 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                                         ^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-run-length-encoding-0.almd:17:29
  in call to list.first()
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Fix the argument type
   |
17 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-0.almd:18:10
  in variable acc
  here: acc + string.repeat(next, count - 1)
  hint: Check the variable name
   |
18 |          acc + string.repeat(next, count - 1)
   |          ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-0.almd:18:36
  in variable count
  here: acc + string.repeat(next, count - 1)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
18 |          acc + string.repeat(next, count - 1)
   |                                    ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:8:42
  in fn 'rle_encode'
  here: int.to_string(count + 1) + c
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |               int.to_string(count + 1) + c
  |                                          ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:18:44
  in fn 'rle_decode'
  here: acc + string.repeat(next, count - 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |          acc + string.repeat(next, count - 1)
   |                                            ^

13 error(s) found
FAILED: /tmp/dojo-run-length-encoding-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 9:13 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_empty(acc) then "1" + c 
    else 
      let last = string.last(acc) ?? ""
      in if last == c then 
        let count = int.parse(string.drop_end(acc, 1)) ?? 1
        in int.to_string(count + 1) + c
      else acc + "1" + c
  )

fn rle_decode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_digit(c) then 
      let count = int.parse(c) ?? 1
      in let next = list.first(string.drop(acc, 1)) ?? ""
      in acc + string.repeat(next, count - 1)
    else acc + c
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:6:7
  in let-in
  here: let last = string.last(acc) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let last = string.last(acc) ?? ""
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:8:9
  in let-in
  here: let count = int.parse(string.drop_end(acc, 1)) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = int.parse(string.drop_end(acc, 1)) ?? 1
  |         ^^^
error: Expected expression at line 10:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:10:7
  here: else acc + "1" + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |       else acc + "1" + c
   |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-1.almd:17:7
  in let-in
  here: let count = int.parse(c) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let count = int.parse(c) ?? 1
   |       ^^^
error: Expected expression at line 20:5 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:20:5
  here: else acc + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |     else acc + c
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-1.almd:9:23
  in variable count
  here: int.to_string(count + 1) + c
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |         int.to_string(count + 1) + c
  |                       ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-1.almd:9:36
  in variable c
  here: int.to_string(count + 1) + c
  hint: Did you mean `s`?
  try:
      s
  |
9 |         int.to_string(count + 1) + c
  |                                    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-1.almd:18:41
  in variable acc
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Check the variable name
   |
18 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                                         ^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-run-length-encoding-1.almd:18:29
  in call to list.first()
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Fix the argument type
   |
18 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-1.almd:19:7
  in variable acc
  here: acc + string.repeat(next, count - 1)
  hint: Check the variable name
   |
19 |       acc + string.repeat(next, count - 1)
   |       ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-1.almd:19:33
  in variable count
  here: acc + string.repeat(next, count - 1)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
19 |       acc + string.repeat(next, count - 1)
   |                                 ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:9:36
  in fn 'rle_encode'
  here: int.to_string(count + 1) + c
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |         int.to_string(count + 1) + c
  |                                    ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:19:41
  in fn 'rle_decode'
  here: acc + string.repeat(next, count - 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |       acc + string.repeat(next, count - 1)
   |                                         ^

13 error(s) found
FAILED: /tmp/dojo-run-length-encoding-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 10:7 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_empty(acc) then "1" + c 
    else 
      let last = string.last(acc) ?? ""
      in if last == c then 
        let count = int.parse(string.drop_end(acc, 1)) ?? 1
        in int.to_string(count + 1) + c
      else acc + "1" + c
  )

fn rle_decode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_digit(c) then 
      let count = int.parse(c) ?? 1
      in let next = list.first(string.drop(acc, 1)) ?? ""
      in acc + string.repeat(next, count - 1)
    else acc + c
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-2.almd:6:7
  in let-in
  here: let last = string.last(acc) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let last = string.last(acc) ?? ""
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-2.almd:8:9
  in let-in
  here: let count = int.parse(string.drop_end(acc, 1)) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = int.parse(string.drop_end(acc, 1)) ?? 1
  |         ^^^
error: Expected expression at line 10:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:10:7
  here: else acc + "1" + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |       else acc + "1" + c
   |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-2.almd:17:7
  in let-in
  here: let count = int.parse(c) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let count = int.parse(c) ?? 1
   |       ^^^
error: Expected expression at line 20:5 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:20:5
  here: else acc + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |     else acc + c
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-2.almd:9:23
  in variable count
  here: int.to_string(count + 1) + c
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |         int.to_string(count + 1) + c
  |                       ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-2.almd:9:36
  in variable c
  here: int.to_string(count + 1) + c
  hint: Did you mean `s`?
  try:
      s
  |
9 |         int.to_string(count + 1) + c
  |                                    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-2.almd:18:41
  in variable acc
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Check the variable name
   |
18 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                                         ^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-run-length-encoding-2.almd:18:29
  in call to list.first()
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Fix the argument type
   |
18 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-2.almd:19:7
  in variable acc
  here: acc + string.repeat(next, count - 1)
  hint: Check the variable name
   |
19 |       acc + string.repeat(next, count - 1)
   |       ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-2.almd:19:33
  in variable count
  here: acc + string.repeat(next, count - 1)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
19 |       acc + string.repeat(next, count - 1)
   |                                 ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:9:36
  in fn 'rle_encode'
  here: int.to_string(count + 1) + c
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |         int.to_string(count + 1) + c
  |                                    ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:19:41
  in fn 'rle_decode'
  here: acc + string.repeat(next, count - 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |       acc + string.repeat(next, count - 1)
   |                                         ^

13 error(s) found
FAILED: /tmp/dojo-run-length-encoding-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 10:7 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_empty(acc) then "1" + c 
    else 
      let last = string.last(acc) ?? ""
      in if last == c then 
        let count = int.parse(string.drop_end(acc, 1)) ?? 1
        in int.to_string(count + 1) + c
      else acc + "1" + c
  )

fn rle_decode(s: String) -> String = 
  let chars = string.to_list(s)
  in list.fold(chars, "", (acc, c) => 
    if string.is_digit(c) then 
      let count = int.parse(c) ?? 1
      in let next = list.first(string.drop(acc, 1)) ?? ""
      in acc + string.repeat(next, count - 1)
    else acc + c
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-3.almd:6:7
  in let-in
  here: let last = string.last(acc) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let last = string.last(acc) ?? ""
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-3.almd:8:9
  in let-in
  here: let count = int.parse(string.drop_end(acc, 1)) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = int.parse(string.drop_end(acc, 1)) ?? 1
  |         ^^^
error: Expected expression at line 10:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-3.almd:10:7
  here: else acc + "1" + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |       else acc + "1" + c
   |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-3.almd:17:7
  in let-in
  here: let count = int.parse(c) ?? 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let count = int.parse(c) ?? 1
   |       ^^^
error: Expected expression at line 20:5 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-3.almd:20:5
  here: else acc + c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |     else acc + c
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-3.almd:9:23
  in variable count
  here: int.to_string(count + 1) + c
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |         int.to_string(count + 1) + c
  |                       ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-3.almd:9:36
  in variable c
  here: int.to_string(count + 1) + c
  hint: Did you mean `s`?
  try:
      s
  |
9 |         int.to_string(count + 1) + c
  |                                    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-3.almd:18:41
  in variable acc
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Check the variable name
   |
18 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                                         ^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-run-length-encoding-3.almd:18:29
  in call to list.first()
  here: let next = list.first(string.drop(acc, 1)) ?? ""
  hint: Fix the argument type
   |
18 |       let next = list.first(string.drop(acc, 1)) ?? ""
   |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-run-length-encoding-3.almd:19:7
  in variable acc
  here: acc + string.repeat(next, count - 1)
  hint: Check the variable name
   |
19 |       acc + string.repeat(next, count - 1)
   |       ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-3.almd:19:33
  in variable count
  here: acc + string.repeat(next, count - 1)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
19 |       acc + string.repeat(next, count - 1)
   |                                 ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:9:36
  in fn 'rle_encode'
  here: int.to_string(count + 1) + c
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |         int.to_string(count + 1) + c
  |                                    ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:19:41
  in fn 'rle_decode'
  here: acc + string.repeat(next, count - 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |       acc + string.repeat(next, count - 1)
   |                                         ^

13 error(s) found
FAILED: /tmp/dojo-run-length-encoding-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 10:7 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-run-length-encoding-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
