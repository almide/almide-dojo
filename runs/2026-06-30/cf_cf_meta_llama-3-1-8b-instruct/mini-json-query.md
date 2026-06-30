# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.sum(jcount)
  JObj(xs) => xs.sum(jcount)
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(_, v)| jflatten_strings(v))
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 2:23 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:2:23
  |
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  |                       ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(_, v)| jflatten_strings(v))
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
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(k, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.sum(jcount)
  JObj(xs) => xs.sum(|(_, v)| jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(_, v)| jflatten_strings(v))
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
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(k, v)| v)
  |                       ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(_, v)| jflatten_strings(v))
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
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.sum(jcount)
  JObj(xs) => xs.sum(|(_, v)| jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(_, v)| jflatten_strings(v))
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
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  |                       ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(_, v)| jflatten_strings(v))
   |                           ^
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
  JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => xs.sum(jcount)
  JObj(xs) => xs.sum(|(_, v)| jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => xs.flat_map(jflatten_strings)
  JObj(xs) => xs.flat_map(|(k, v)| jflatten_strings(v))
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 2:23 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:2:23
  |
2 |   JObj(xs) => xs.find(|(k, v)| k == key).map(|(_, v)| v)
  |                       ^
error: Expected FatArrow at line 7:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:7:9
  |
7 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected expression at line 15:27 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:15:27
   |
15 |   JObj(xs) => xs.flat_map(|(k, v)| jflatten_strings(v))
   |                           ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:29:68
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:29:89
  in list element
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:33:86
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:34:116
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
