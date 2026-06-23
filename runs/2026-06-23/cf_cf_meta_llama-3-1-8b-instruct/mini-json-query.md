# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => match list.find(xs, |(k, v)| k == key) {
    some((_, v)) => some(v)
    none => none
  }
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, |(_, v)| jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.repeat(s, 1)
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(_, v)| jflatten_strings(v))
  _ => list.repeat("", 0)
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 2:35 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:2:35
  |
2 |   JObj(xs) => match list.find(xs, |(k, v)| k == key) {
  |                                   ^
error: Expected FatArrow at line 10:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:10:9
   |
10 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected expression at line 18:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:33
   |
18 |   JObj(xs) => list.flat_map(xs, |(_, v)| jflatten_strings(v))
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
  JObj(xs) => match list.find(xs, |(k, v)| k == key) {
    some((_, v)) => some(v)
    none => none
  }
  JNull => none
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, |(_, v)| jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.repeat(s, 1)
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(_, v)| jflatten_strings(v))
  _ => list.repeat("", 0)
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 2:35 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:2:35
  |
2 |   JObj(xs) => match list.find(xs, |(k, v)| k == key) {
  |                                   ^
error: Expected FatArrow at line 11:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:9
   |
11 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected expression at line 19:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:19:33
   |
19 |   JObj(xs) => list.flat_map(xs, |(_, v)| jflatten_strings(v))
   |                                 ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:33:68
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:33:89
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:37:86
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
  JObj(xs) => match list.find(xs, |(k, v)| k == key) {
    some((_, v)) => some(v)
    none => none
  }
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, |(_, v) => jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.repeat(s, 1)
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(_, v) => jflatten_strings(v))
  _ => list.repeat("", 0)
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 2:35 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:2:35
  |
2 |   JObj(xs) => match list.find(xs, |(k, v)| k == key) {
  |                                   ^
error: Expected FatArrow at line 10:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:10:9
   |
10 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected expression at line 18:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:18:33
   |
18 |   JObj(xs) => list.flat_map(xs, |(_, v) => jflatten_strings(v))
   |                                 ^
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

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => match list.find(xs, |(k, v)| k == key) {
    some((_, v)) => some(v)
    none => none
  }
  JNull | JBool(_) | JNum(_) | JStr(_) => none
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, |(_, v) => jcount(v))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => list.repeat(s, 1)
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, |(_, v) => jflatten_strings(v))
  _ => list.repeat("", 0)
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 2:35 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:2:35
  |
2 |   JObj(xs) => match list.find(xs, |(k, v)| k == key) {
  |                                   ^
error: Expected FatArrow at line 11:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:9
   |
11 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected expression at line 19:33 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:19:33
   |
19 |   JObj(xs) => list.flat_map(xs, |(_, v) => jflatten_strings(v))
   |                                 ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:33:68
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:33:89
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:37:86
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
