# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, fn (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or_else(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, fn (x) => match x {
    (k, v) => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 2:29 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:2:29
  |
2 |   JObj(xs) => list.find(xs, fn (x) => match x {
  |                             ^
error: Expected function name at line 2:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:2:32
  |
2 |   JObj(xs) => list.find(xs, fn (x) => match x {
  |                                ^
error: Expected expression at line 14:39 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:14:39
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                       ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:14:42
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                          ^
error: Expected expression at line 22:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:22:33
   |
22 |   JObj(xs) => list.flat_map(xs, fn (x) => match x {
   |                                 ^
error: Expected function name at line 22:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:22:36
   |
22 |   JObj(xs) => list.flat_map(xs, fn (x) => match x {
   |                                    ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:38:68
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:38:89
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:42:86
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

11 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, fn (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, fn (x) => match x {
    (k, v) => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 2:29 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:2:29
  |
2 |   JObj(xs) => list.find(xs, fn (x) => match x {
  |                             ^
error: Expected function name at line 2:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:2:32
  |
2 |   JObj(xs) => list.find(xs, fn (x) => match x {
  |                                ^
error: Expected expression at line 14:39 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:14:39
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                       ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:14:42
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                          ^
error: Expected expression at line 22:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:22:33
   |
22 |   JObj(xs) => list.flat_map(xs, fn (x) => match x {
   |                                 ^
error: Expected function name at line 22:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:22:36
   |
22 |   JObj(xs) => list.flat_map(xs, fn (x) => match x {
   |                                    ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:38:68
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:38:89
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:42:86
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

11 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
    (k, v) => jcount(v)
  })) // changed to match pattern
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, fn (x) => match x {
    JStr(s) => [s]
    JObj(xs) => list.flat_map(xs, fn (x) => match x {
      (k, v) => jflatten_strings(v)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 14:39 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:14:39
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                       ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:14:42
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                          ^
error: Expected expression at line 21:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:21:33
   |
21 |   JArr(xs) => list.flat_map(xs, fn (x) => match x {
   |                                 ^
error: Expected function name at line 21:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:21:36
   |
21 |   JArr(xs) => list.flat_map(xs, fn (x) => match x {
   |                                    ^
error: Expected function name at line 23:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:23:38
   |
23 |     JObj(xs) => list.flat_map(xs, fn (x) => match x {
   |                                      ^
error[E005]: argument 'f' expects fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:3:45
  in call to list.find()
  hint: Fix the argument type
  |
3 |     (k, v) => if k == key then some(v) else none
  |                                             ^^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:26:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
26 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:27:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
27 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:28:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
28 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:29:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
29 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:3:45
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
3 |     (k, v) => if k == key then some(v) else none
  |                                             ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, ?2) but got Option[?4]
  --> /tmp/dojo-mini-json-query-2.almd:4:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |   }) |> option.unwrap_or(none)
  |                          ^^^^
error[E001]: type mismatch in match arm: expected (String, ?2) but got Option[?5]
  --> /tmp/dojo-mini-json-query-2.almd:5:8
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
5 |   _ => none
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?2)
  --> /tmp/dojo-mini-json-query-2.almd:5:8
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
5 |   _ => none
  |        ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:26:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
26 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-2.almd:26:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
26 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:27:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
27 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:28:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
28 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:29:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
29 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:34:68
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:34:89
  in list element
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:38:86
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:39:116
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:39:116
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

24 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, fn (x) => match x {
    JStr(s) => [s]
    JObj(xs) => jflatten_strings(JObj(xs))
    _ => []
  })
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 14:39 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:14:39
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                       ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:14:42
   |
14 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                          ^
error: Expected expression at line 21:33 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:21:33
   |
21 |   JArr(xs) => list.flat_map(xs, fn (x) => match x {
   |                                 ^
error: Expected function name at line 21:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:21:36
   |
21 |   JArr(xs) => list.flat_map(xs, fn (x) => match x {
   |                                    ^
error[E005]: argument 'f' expects fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-3.almd:3:45
  in call to list.find()
  hint: Fix the argument type
  |
3 |     (k, v) => if k == key then some(v) else none
  |                                             ^^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:30:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:31:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:32:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:33:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-3.almd:3:45
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
3 |     (k, v) => if k == key then some(v) else none
  |                                             ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, ?2) but got Option[?4]
  --> /tmp/dojo-mini-json-query-3.almd:4:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |   }) |> option.unwrap_or(none)
  |                          ^^^^
error[E001]: type mismatch in match arm: expected (String, ?2) but got Option[?5]
  --> /tmp/dojo-mini-json-query-3.almd:5:8
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
5 |   _ => none
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?2)
  --> /tmp/dojo-mini-json-query-3.almd:5:8
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
5 |   _ => none
  |        ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:30:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-3.almd:30:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:31:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:32:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:33:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:38:68
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:38:89
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:42:86
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:43:116
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

23 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
