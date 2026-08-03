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
  | JObj(xs) => xs |> list.find((x) => x.0 == key) |> option.map((x) => x.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => xs |> list.sum((x) => jcount(x))
  | JObj(xs) => xs |> list.sum((x) => jcount(x.1))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => xs |> list.flat_map((x) => jflatten_strings(x))
  | JObj(xs) => xs |> list.flat_map((x) => jflatten_strings(x.1))
  | _ => []

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:3:3
  |
3 |   | JObj(xs) => xs |> list.find((x) => x.0 == key) |> option.map((x) => x.1)
  |   ^
error: Expected LBrace at line 8:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:8:3
  |
8 |   | JNull => 1
  |   ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:3
   |
17 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:32:68
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:32:89
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:36:86
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
    xs |> list.find((x) => x.0 == key) |> option.map((x) => x.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) =>
    xs |> list.map((x) => jcount(x)) |> list.sum
  | JObj(xs) =>
    xs |> list.map((x) => jcount(x.1)) |> list.sum

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) =>
    xs |> list.flat_map((x) => match x
      | JStr(s) => [s]
      | _ => jflatten_strings(x))
  | JObj(xs) =>
    xs |> list.flat_map((x) => match x.1
      | JStr(s)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:9:3
  |
9 |   | JNull => 1
  |   ^
error: Expected LBrace at line 20:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:20:3
   |
20 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:37:68
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:37:89
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:41:86
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:42:116
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:42:116
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
    xs |> list.find((x) => x.0 == key) |> option.map((x) => x.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) =>
    xs |> list.map((x) => jcount(x)) |> list.sum
  | JObj(xs) =>
    xs |> list.map((x) => match x.1
      | JNull => 1
      | JBool(_) => 1
      | JNum(_) => 1
      | JStr(_) => 1
      | JArr(xxs) => jcount(JArr(xxs))
      | JObj(_) => jcount(JObj(xxs)))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) =>
    xs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:9:3
  |
9 |   | JNull => 1
  |   ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:38:68
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:38:89
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:42:86
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
    xs |> list.find((x) => x.0 == key) |> option.map((x) => x.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) =>
    xs |> list.map((x) => jcount(x)) |> list.sum
  | JObj(xs) =>
    xs |> list.map((x) => match x.1
      | JNull => 1
      | JBool(_) => 1
      | JNum(_) => 1
      | JStr(_) => 1
      | JArr(xxs) => jcount(JArr(xxs))
      | JObj(xxs) => jcount(JObj(xxs)))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:3:3
  |
3 |   | JObj(xs) =>
  |   ^
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:9:3
  |
9 |   | JNull => 1
  |   ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:37:68
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:37:89
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:41:86
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:42:116
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:42:116
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
