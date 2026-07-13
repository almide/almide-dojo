# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find((k, v) => k == key).map(|(_, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.map(|(_, v)| jcount(v)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(k, v)| jflatten_strings(v))
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 2:47 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:2:47
  |
2 |   JObj(xs) => xs.find((k, v) => k == key).map(|(_, v)| v)
  |                                               ^
error: Expected expression at line 12:31 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:12:31
   |
12 |   JObj(xs) => list.sum(xs.map(|(_, v)| jcount(v)))
   |                               ^
error: Expected expression at line 18:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:33
   |
18 |   JObj(xs) => list.flat_map(xs, |(k, v)| jflatten_strings(v))
   |                                 ^
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
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.map(|(_, v)| jcount(v)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(k, v)| match v {
    JStr(s) => [s]
    _ => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 2:23 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:2:23
  |
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  |                       ^
error: Expected expression at line 12:31 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:12:31
   |
12 |   JObj(xs) => list.sum(xs.map(|(_, v)| jcount(v)))
   |                               ^
error: Expected expression at line 18:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:18:33
   |
18 |   JObj(xs) => list.flat_map(xs, |(k, v)| match v {
   |                                 ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(k, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.map(|(k, v)| jcount(v)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(k, v)| match v {
    JStr(s) => [s]
    _ => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 2:23 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:2:23
  |
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(k, v)| v)
  |                       ^
error: Expected expression at line 12:31 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:12:31
   |
12 |   JObj(xs) => list.sum(xs.map(|(k, v)| jcount(v)))
   |                               ^
error: Expected expression at line 18:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:18:33
   |
18 |   JObj(xs) => list.flat_map(xs, |(k, v)| match v {
   |                                 ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(k, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.map(|(k, v)| match v {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map(|(k, v)| jcount(v)))
    _ => 0
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 2:23 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:2:23
  |
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(k, v)| v)
  |                       ^
error: Expected expression at line 12:31 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:12:31
   |
12 |   JObj(xs) => list.sum(xs.map(|(k, v)| match v {
   |                               ^
error: Expected expression at line 28:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:28:1
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
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
