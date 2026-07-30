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
      match xs {
        some((k, v)) when k == key => some(v)
        _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
      }
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 5:22 (got Ident 'when')
  --> /tmp/dojo-mini-json-query-0.almd:5:22
  |
5 |         some((k, v)) when k == key => some(v)
  |                      ^
error: Expected function name at line 6:30 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:6:30
  |
6 |         _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
  |                              ^
error: Expected function name at line 6:68 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:6:68
  |
6 |         _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
  |                                                                    ^
error: Expected expression at line 18:41 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:18:41
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
   |                                         ^
error: Expected function name at line 18:43 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:18:43
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
   |                                           ^
error: Expected expression at line 25:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:25:35
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
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

12 error(s) found
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
      match xs {
        some((k, v)) if k == key => some(v)
        _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
      }
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v) |> option.unwrap_or(0)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
    _ => []
  }

effect fn main() ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 6:28 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:6:28
  |
6 |         _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
  |                            ^
error: Expected function name at line 6:30 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:6:30
  |
6 |         _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
  |                              ^
error: Expected function name at line 6:68 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:6:68
  |
6 |         _ => list.find(xs, fn((k, v)) => k == key) |> option.map(fn((_, v)) => v)
  |                                                                    ^
error: Expected expression at line 18:41 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:18:41
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v) |> option.unwrap_or(0)))
   |                                         ^
error: Expected function name at line 18:43 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:18:43
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v) |> option.unwrap_or(0)))
   |                                           ^
error: Expected expression at line 25:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:25:35
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                     ^
error: Expected type name at line 29:20 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:29:20
   |
29 | effect fn main() ->
   |                    ^
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

13 error(s) found
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
      match xs {
        some((k, v)) if k == key => some(v)
        _ => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 18:41 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:18:41
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
   |                                         ^
error: Expected function name at line 18:43 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:18:43
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
   |                                           ^
error: Expected expression at line 25:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:25:35
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                     ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:31:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:32:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:33:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:34:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:31:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-2.almd:31:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:32:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:33:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:34:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
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

18 error(s) found
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
      match xs {
        some((k, v)) if k == key => some(v)
        _ => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 18:41 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:18:41
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
   |                                         ^
error: Expected function name at line 18:43 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:18:43
   |
18 |     JObj(xs) => list.sum(xs |> list.map(fn((_, v)) => jcount(v)))
   |                                           ^
error: Expected expression at line 25:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:25:35
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 25:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:25:37
   |
25 |     JObj(xs) => list.flat_map(xs, fn((_, v)) => jflatten_strings(v))
   |                                     ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:31:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:32:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:33:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:34:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:31:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-3.almd:31:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:32:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:33:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:34:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:39:68
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:39:89
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:43:86
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:44:116
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

18 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
