# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      xs
        |> list.find({ (k, v) -> k == key })
        |> option.map({ (k, v) -> v })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map({ (k, v) -> jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs |> list.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs |> list.map({ (k, v) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 13:31 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-0.almd:13:31
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                               ^
error: Expected expression at line 14:32 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-0.almd:14:32
   |
14 |         |> option.map({ (k, v) -> v })
   |                                ^
error: Expected FatArrow at line 20:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:20:11
   |
20 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 29:55 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-0.almd:29:55
   |
29 |     JObj(xs) => list.flat_map(xs |> list.map({ (k, v) ->
   |                                                       ^
error: Expected expression at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:31:1
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 29:45
  --> /tmp/dojo-mini-json-query-0.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(xs) => list.flat_map(xs |> list.map({ (k, v) ->
   |                                             --------------- '(' opened here
...
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E003]: undefined variable 'k'
  --> /tmp/dojo-mini-json-query-0.almd:13:25
  in variable k
  hint: Did you mean `key`?
  try:
      // k  →  key
      key
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                         ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-0.almd:13:28
  in variable v
  hint: Did you mean `xs`?
  try:
      // v  →  xs
      xs
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                            ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-0.almd:13:28
  in call to list.find()
  hint: Fix the argument type
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                            ^
error[E003]: undefined variable 'k'
  --> /tmp/dojo-mini-json-query-0.almd:14:26
  in variable k
  hint: Did you mean `key`?
  try:
      // k  →  key
      key
   |
14 |         |> option.map({ (k, v) -> v })
   |                          ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-0.almd:14:29
  in variable v
  hint: Did you mean `xs`?
  try:
      // v  →  xs
      xs
   |
14 |         |> option.map({ (k, v) -> v })
   |                             ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got Unit
  --> /tmp/dojo-mini-json-query-0.almd:14:29
  in call to option.map()
  hint: Fix the argument type
   |
14 |         |> option.map({ (k, v) -> v })
   |                             ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-0.almd:13:28
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                            ^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got Unit
  --> /tmp/dojo-mini-json-query-0.almd:14:29
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
14 |         |> option.map({ (k, v) -> v })
   |                             ^

14 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      xs
        |> list.find({ (k, v) -> k == key })
        |> option.map({ (k, v) -> v })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map({ (k, v) -> jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs |> list.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs |> list.map({ (k, v) -> jflatten_strings(v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 13:31 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-1.almd:13:31
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                               ^
error: Expected expression at line 14:32 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-1.almd:14:32
   |
14 |         |> option.map({ (k, v) -> v })
   |                                ^
error: Expected FatArrow at line 20:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:20:11
   |
20 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 29:55 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-1.almd:29:55
   |
29 |     JObj(xs) => list.flat_map(xs |> list.map({ (k, v) -> jflatten_strings(v
   |                                                       ^
error: Expected expression at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:31:1
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 29:45
  --> /tmp/dojo-mini-json-query-1.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(xs) => list.flat_map(xs |> list.map({ (k, v) -> jflatten_strings(v
   |                                             --------------- '(' opened here
...
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E003]: undefined variable 'k'
  --> /tmp/dojo-mini-json-query-1.almd:13:25
  in variable k
  hint: Did you mean `key`?
  try:
      // k  →  key
      key
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                         ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-1.almd:13:28
  in variable v
  hint: Did you mean `xs`?
  try:
      // v  →  xs
      xs
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                            ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-1.almd:13:28
  in call to list.find()
  hint: Fix the argument type
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                            ^
error[E003]: undefined variable 'k'
  --> /tmp/dojo-mini-json-query-1.almd:14:26
  in variable k
  hint: Did you mean `key`?
  try:
      // k  →  key
      key
   |
14 |         |> option.map({ (k, v) -> v })
   |                          ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-1.almd:14:29
  in variable v
  hint: Did you mean `xs`?
  try:
      // v  →  xs
      xs
   |
14 |         |> option.map({ (k, v) -> v })
   |                             ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got Unit
  --> /tmp/dojo-mini-json-query-1.almd:14:29
  in call to option.map()
  hint: Fix the argument type
   |
14 |         |> option.map({ (k, v) -> v })
   |                             ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-1.almd:13:28
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
13 |         |> list.find({ (k, v) -> k == key })
   |                            ^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got Unit
  --> /tmp/dojo-mini-json-query-1.almd:14:29
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
14 |         |> option.map({ (k, v) -> v })
   |                             ^

14 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      match xs |> list.find({ (k, v) -> k == key }) {
        some((k, v)) => some(v)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map({ (k, v) -> jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs |> list.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs |> list.map({ (k, v)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 12:38 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-2.almd:12:38
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                      ^
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:32:1
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 30:45
  --> /tmp/dojo-mini-json-query-2.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JObj(xs) => list.flat_map(xs |> list.map({ (k, v)
   |                                             --------------- '(' opened here
...
33 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E003]: undefined variable 'k'
  --> /tmp/dojo-mini-json-query-2.almd:12:32
  in variable k
  hint: Did you mean `key`?
  try:
      // k  →  key
      key
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-2.almd:12:35
  in variable v
  hint: Did you mean `xs`?
  try:
      // v  →  xs
      xs
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                   ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-2.almd:12:35
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                   ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-2.almd:12:35
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                   ^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      match xs |> list.find({ (k, v) -> k == key }) {
        some((k, v)) => some(v)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map({ (k, v) -> jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs |> list.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs |> list.map({ (k, v)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 12:38 (got Arrow '->')
  --> /tmp/dojo-mini-json-query-3.almd:12:38
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                      ^
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:32:1
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 30:45
  --> /tmp/dojo-mini-json-query-3.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JObj(xs) => list.flat_map(xs |> list.map({ (k, v)
   |                                             --------------- '(' opened here
...
33 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E003]: undefined variable 'k'
  --> /tmp/dojo-mini-json-query-3.almd:12:32
  in variable k
  hint: Did you mean `key`?
  try:
      // k  →  key
      key
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-3.almd:12:35
  in variable v
  hint: Did you mean `xs`?
  try:
      // v  →  xs
      xs
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                   ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:12:35
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                   ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:12:35
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs |> list.find({ (k, v) -> k == key }) {
   |                                   ^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
