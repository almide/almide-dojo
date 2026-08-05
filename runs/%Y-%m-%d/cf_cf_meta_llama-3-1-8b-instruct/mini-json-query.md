# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.len() |> list.sum(list.map(xs, jcount))
  JObj(xs) => xs.len() |> list.sum(list.map(xs, jcount))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(_, v) => jflatten_strings(v))
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 2:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:2:27
  |
2 |   JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  |                           ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(_, v) => jflatten_strings(v))
   |                           ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:29:68
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:29:89
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:33:86
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.len() |> list.sum(xs.map(jcount))
  JObj(xs) => xs.len() |> list.sum(xs.map(|(_, v) => jcount(v)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(_, v) => jflatten_strings(v))
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 2:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:2:27
  |
2 |   JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  |                           ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(_, v) => jflatten_strings(v))
   |                           ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:29:68
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:29:89
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:33:86
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.len() |> list.sum(xs.map(jcount))
  JObj(xs) => xs.len() |> list.sum(xs.map(|(_, v) => jcount(v)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(_, v) => jflatten_strings(v))
  _ => []
}

effect fn main() -> Unit = {
  let _ = assert_eq(jget(JObj([("a", JNum(1))]), "a"), some(JNum(1)));
  let _ = assert_eq(jcount(JNum(1)), 1);
  let _ = assert_eq(jcount(JArr([JNum
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 2:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:2:27
  |
2 |   JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  |                           ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(_, v) => jflatten_strings(v))
   |                           ^
error: Expected ']' to close list literal opened at line 22:33
  --> /tmp/dojo-mini-json-query-2.almd:24:1
  hint: Add ']' or check for a missing delimiter inside the list literal
   |
22 |   let _ = assert_eq(jcount(JArr([JNum
   |                                 --------------- '[' opened here
...
24 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:32:68
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:32:89
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:36:86
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

9 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.len() |> list.sum(xs.map(jcount))
  JObj(xs) => xs.len() |> list.sum(xs.map(|(_, v) => jcount(v)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(k, v) => match v {
    JStr(s) => [s]
    _ => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {
  let _ = assert_eq(jget(JObj([("a", JNum(1))]), "a"), some(JNum(1)));
  let _ = assert_eq(jcount(JNum
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 2:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:2:27
  |
2 |   JObj(xs) => xs.find_map(|(k, v)| if k == key then some(v) else none())
  |                           ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(k, v) => match v {
   |                           ^
error: Expected ')' to close function call opened at line 24:27
  --> /tmp/dojo-mini-json-query-3.almd:26:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
24 |   let _ = assert_eq(jcount(JNum
   |                           --------------- '(' opened here
...
26 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:34:68
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:34:89
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:38:86
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:39:116
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:39:116
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

9 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
