# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs |> list.find_map { |(k, v)| if k == key then some(v) else none() } |> option.unwrap_or_else(_ => none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs |> list.sum(list.map(jcount))
  JObj(xs) => xs |> list.sum(list.map(jcount))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs |> list.flat_map(jflatten_strings)
  JObj(xs) => xs |> list.flat_map { |(k, v)| [jflatten_strings(v)] }
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 2:35 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:2:35
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
2 |   JObj(xs) => xs |> list.find_map { |(k, v)| if k == key then some(v) else none() } |> option.unwrap_or_else(_ => none())
  |                                   ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected pattern at line 15:35 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:15:35
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |   JObj(xs) => xs |> list.flat_map { |(k, v)| [jflatten_strings(v)] }
   |                                   ^
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
  JObj(xs) => xs |> list.find_map { |(k, v)| if k == key then some(v) else none() } |> option.unwrap_or(none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs |> list.map(jcount) |> list.sum
  JObj(xs) => xs |> list.map(jcount) |> list.sum
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs |> list.flat_map(jflatten_strings)
  JObj(xs) => xs |> list.flat_map { |(k, v)| match v { JStr(s) => [s]; _ => [] } }
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 2:35 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:2:35
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
2 |   JObj(xs) => xs |> list.find_map { |(k, v)| if k == key then some(v) else none() } |> option.unwrap_or(none())
  |                                   ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected pattern at line 15:35 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:15:35
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |   JObj(xs) => xs |> list.flat_map { |(k, v)| match v { JStr(s) => [s]; _ => [] } }
   |                                   ^
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
  JObj(xs) => xs |> list.find { |(k, v)| k == key } |> option.map(some) |> option.unwrap_or(none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs |> list.map(jcount) |> list.sum
  JObj(xs) => xs |> list.map { |(_, v)| jcount(v) } |> list.sum
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs |> list.flat_map(jflatten_strings)
  JObj(xs) => xs |> list.flat_map { |(_, v)| match v { JStr(s) => [s]; _ => [] } }
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 2:31 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:2:31
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
2 |   JObj(xs) => xs |> list.find { |(k, v)| k == key } |> option.map(some) |> option.unwrap_or(none())
  |                               ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected pattern at line 15:35 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:15:35
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |   JObj(xs) => xs |> list.flat_map { |(_, v)| match v { JStr(s) => [s]; _ => [] } }
   |                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:29:68
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:29:89
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:33:86
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs |> list.find { |(k, v)| k == key } |> option.map(some) |> option.unwrap_or(none())
  _ => none()
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs |> list.map(jcount) |> list.sum
  JObj(xs) => xs |> list.map { |(_, v)| jcount(v) } |> list.sum
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs |> list.flat_map(jflatten_strings)
  JObj(xs) => xs |> list.flat_map { |(_, v)| match v { JStr(s) => [s]; _ => [] } }
}

effect fn main() -> Unit = {
  let jobj = JObj([("a", JNum(1)), ("b", JStr("hi"))])
  assert_eq(jget(jobj, "a"), some(J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 2:31 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:2:31
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
2 |   JObj(xs) => xs |> list.find { |(k, v)| k == key } |> option.map(some) |> option.unwrap_or(none())
  |                               ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected pattern at line 15:35 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:15:35
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |   JObj(xs) => xs |> list.flat_map { |(_, v)| match v { JStr(s) => [s]; _ => [] } }
   |                                   ^
error: Expected ')' to close some() opened at line 20:34
  --> /tmp/dojo-mini-json-query-3.almd:20:36
  hint: Add ')' or check for a missing delimiter inside the some()
   |
20 |   assert_eq(jget(jobj, "a"), some(J
   |                                  --------------- '(' opened here
   |
20 |   assert_eq(jget(jobj, "a"), some(J
   |                                    ^
error: Expected expression at line 22:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:22:1
   |
22 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E001]: type mismatch in list element: expected (String, JNum) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:19:47
  in list element
  hint: Fix the expression type or change the expected type
   |
19 |   let jobj = JObj([("a", JNum(1)), ("b", JStr("hi"))])
   |                                               ^^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:30:68
  in list element
  hint: Fix the expression type or change the expected type
   |
30 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:30:89
  in list element
  hint: Fix the expression type or change the expected type
   |
30 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:34:86
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:35:116
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:35:116
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

11 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
