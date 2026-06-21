# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      match list.find_index(xs, fn(x) => x.0 == key) {
        some(i) => list.get(xs, i).map(fn(x) => x.1)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
    JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 4:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:4:33
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                 ^
error: Expected function name at line 4:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:4:35
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                   ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:5:42
  |
5 |         some(i) => list.get(xs, i).map(fn(x) => x.1)
  |                                          ^
error: Expected expression at line 17:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:17:33
   |
17 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                 ^
error: Expected function name at line 17:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:17:35
   |
17 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                   ^
error: Expected function name at line 18:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:18:35
   |
18 |     JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
   |                                   ^
error: Expected expression at line 24:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:24:35
   |
24 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                   ^
error: Expected function name at line 24:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:24:37
   |
24 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
   |                                     ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:39:68
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:39:89
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:43:86
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

14 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      match list.find_index(xs, fn(x) => x.0 == key) {
        some(i) => list.get(xs, i).map(fn(x) => x.1)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
    JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 4:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:4:33
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                 ^
error: Expected function name at line 4:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:4:35
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                   ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:5:42
  |
5 |         some(i) => list.get(xs, i).map(fn(x) => x.1)
  |                                          ^
error: Expected expression at line 17:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:17:33
   |
17 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                 ^
error: Expected function name at line 17:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:17:35
   |
17 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                   ^
error: Expected function name at line 18:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:18:35
   |
18 |     JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
   |                                   ^
error: Expected expression at line 24:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:24:35
   |
24 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                   ^
error: Expected function name at line 24:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:24:37
   |
24 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
   |                                     ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:39:68
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:39:89
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:43:86
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

14 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      match list.find_index(xs, fn(x) => x.0 == key) {
        some(i) => list.get(xs, i).map(fn(x) => x.1)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
    JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 4:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:4:33
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                 ^
error: Expected function name at line 4:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:4:35
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                   ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:5:42
  |
5 |         some(i) => list.get(xs, i).map(fn(x) => x.1)
  |                                          ^
error: Expected expression at line 17:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:17:33
   |
17 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                 ^
error: Expected function name at line 17:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:17:35
   |
17 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                   ^
error: Expected function name at line 18:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:18:35
   |
18 |     JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
   |                                   ^
error: Expected expression at line 24:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:24:35
   |
24 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                   ^
error: Expected function name at line 24:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:24:37
   |
24 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
   |                                     ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:39:68
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:39:89
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:43:86
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

14 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      match list.find_index(xs, fn(x) => x.0 == key) {
        some(i) => match list.get(xs, i) {
          some(x) => x.1
          none => none
        }
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
    JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 4:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:4:33
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                 ^
error: Expected function name at line 4:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:4:35
  |
4 |       match list.find_index(xs, fn(x) => x.0 == key) {
  |                                   ^
error: Expected expression at line 20:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:20:33
   |
20 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                 ^
error: Expected function name at line 20:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:20:35
   |
20 |     JArr(xs) => list.sum(xs.map(fn(x) => jcount(x)))
   |                                   ^
error: Expected function name at line 21:35 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:21:35
   |
21 |     JObj(xs) => list.sum(xs.map(fn(x) => jcount(x.1)))
   |                                   ^
error: Expected expression at line 27:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:27:35
   |
27 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                   ^
error: Expected function name at line 27:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:27:37
   |
27 |     JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^
error: Expected function name at line 28:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:28:37
   |
28 |     JObj(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x.1))
   |                                     ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:42:68
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:42:89
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:46:86
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:47:116
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:47:116
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

13 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
