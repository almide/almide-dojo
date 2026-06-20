# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => xs.iterate((x) => match x {
    (k, v) => if k == key then some(v) else none
  }).fold(none, some)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.flat_map((x) => match x {
    (k, v) => list.some(jcount(v))
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.some(s)
  JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
    (k, v) => list.some(jflatten_strings(v))
  }))
  _ => list.none()
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LParen at line 4:21 (got RParen ')')
  --> /tmp/dojo-mini-json-query-0.almd:4:21
  |
4 |   }).fold(none, some)
  |                     ^
error: Expected FatArrow at line 9:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:9:9
  |
9 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected name at line 17:19 (got Some 'some')
  --> /tmp/dojo-mini-json-query-0.almd:17:19
   |
17 |   JStr(s) => list.some(s)
   |                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
  JObj(xs) => xs.iterate((x) => match x {
    (k, v) => if k == key then some(v) else none
  }).fold(none, some)
  JObj(_) => none
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.flat_map((x) => match x {
    (k, v) => list.some(jcount(v))
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.some(s)
  JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
    (k, v) => list.some(jflatten_strings(v))
  }))
  _ => list.none()
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected LParen at line 4:21 (got RParen ')')
  --> /tmp/dojo-mini-json-query-1.almd:4:21
  |
4 |   }).fold(none, some)
  |                     ^
error: Expected FatArrow at line 10:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:10:9
   |
10 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected name at line 18:19 (got Some 'some')
  --> /tmp/dojo-mini-json-query-1.almd:18:19
   |
18 |   JStr(s) => list.some(s)
   |                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:36:68
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:36:89
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:40:86
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
  JObj(xs) => xs.iterate((x) => match x {
    (k, v) => if k == key then some(v) else none
  }).fold(none, some)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.map((x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.some(s)
  JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  JObj(xs) => list.flat_map(xs.map((x) => match x {
    (k, v) => jflatten_strings(v)
  }))
  _ => list.none()
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected LParen at line 4:21 (got RParen ')')
  --> /tmp/dojo-mini-json-query-2.almd:4:21
  |
4 |   }).fold(none, some)
  |                     ^
error: Expected FatArrow at line 9:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:9:9
  |
9 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
  |         ^
error: Expected name at line 17:19 (got Some 'some')
  --> /tmp/dojo-mini-json-query-2.almd:17:19
   |
17 |   JStr(s) => list.some(s)
   |                   ^
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
  JObj(xs) => xs.iterate((x) => match x {
    (k, v) => if k == key then some(v) else none
  }).fold(none, some)
  JObj(_) => none
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs.map(jcount))
  JObj(xs) => list.sum(xs.map((x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.some(s)
  JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  JObj(xs) => list.flat_map(xs.map((x) => match x {
    (k, v) => jflatten_strings(v)
  }))
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected LParen at line 4:21 (got RParen ')')
  --> /tmp/dojo-mini-json-query-3.almd:4:21
  |
4 |   }).fold(none, some)
  |                     ^
error: Expected FatArrow at line 10:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:10:9
   |
10 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected name at line 18:19 (got Some 'some')
  --> /tmp/dojo-mini-json-query-3.almd:18:19
   |
18 |   JStr(s) => list.some(s)
   |                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
