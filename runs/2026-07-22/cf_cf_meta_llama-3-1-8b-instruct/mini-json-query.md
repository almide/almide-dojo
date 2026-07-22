# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj
  | JObj(xs) =>
    match list.find_index(xs, (x) => x.0 == key) {
      some(i) => list.get(xs, i).1
      none => none
    }
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull | JBool(_) | JNum(_) | JStr(_) => 1
  | JArr(xs) => list.sum(xs.map(jcount))
  | JObj(xs) => list.sum(xs.map((x) => jcount(x.1)))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
  | _ => []

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 12:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:12:3
   |
12 |   | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |   ^
error: Expected LBrace at line 18:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:3
   |
18 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:33:68
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:33:89
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:37:86
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj
  | JObj(xs) =>
    match list.find_index(xs, (x) => x.0 == key) {
      some(i) => list.get(xs, i).1
      none => none
    }
  | JObj(_) => none
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull | JBool(_) | JNum(_) | JStr(_) => 1
  | JArr(xs) => list.sum(xs.map(jcount))
  | JObj(xs) => list.sum(xs.map((x) => jcount(x.1)))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
  | _ => []

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 13:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:13:3
   |
13 |   | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |   ^
error: Expected LBrace at line 19:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:19:3
   |
19 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:34:68
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:34:89
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:38:86
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:39:116
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:39:116
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj
  | JObj(xs) =>
    match list.find_index(xs, (x) => x.0 == key) {
      some(i) => match list.get(xs, i) {
        some((_, val)) => some(val)
        none => none
      }
      none => none
    }
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull | JBool(_) | JNum(_) | JStr(_) => 1
  | JArr(xs) => list.sum(xs.map(jcount))
  | JObj(xs) => list.sum(xs.map((x) => match x.1 {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    _ => jcount(x.1)
  }))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (x) => match x.1 {
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 15:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:15:3
   |
15 |   | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |   ^
error: Expected LBrace at line 24:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:24:3
   |
24 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:36:68
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:36:89
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:40:86
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj
  | JObj(xs) =>
    match list.find_index(xs, (x) => x.0 == key) {
      some(i) => match list.get(xs, i) {
        some((_, val)) => some(val)
        none => none
      }
      none => none
    }
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull | JBool(_) | JNum(_) | JStr(_) => 1
  | JArr(xs) => list.sum(xs.map(jcount))
  | JObj(xs) => list.sum(xs.map((x) => match x.1 {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    _ => jcount(x.1)
  }))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (x) => match x.1 {
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 15:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:15:3
   |
15 |   | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |   ^
error: Expected LBrace at line 24:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:24:3
   |
24 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:36:68
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:36:89
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:40:86
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
