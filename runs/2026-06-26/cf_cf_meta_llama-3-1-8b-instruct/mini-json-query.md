# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

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
    _ => 0
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs |> list.map(jflatten_strings))
  JObj(xs) => list.flat_map(xs |> list.map(fn (x) => match x {
    (k, v) => jflatten_strings(v)
    _ => []
  }))
  _
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
error: Expected expression at line 23:44 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:23:44
   |
23 |   JObj(xs) => list.flat_map(xs |> list.map(fn (x) => match x {
   |                                            ^
error: Expected function name at line 23:47 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:23:47
   |
23 |   JObj(xs) => list.flat_map(xs |> list.map(fn (x) => match x {
   |                                               ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:37:68
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:37:89
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:41:86
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:42:116
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:42:116
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
    _ => 0
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs |> list.map(jflatten_strings))
  JObj(xs) => list.flat_map(xs |> list.map(fn (x) => match x {
    (k, v) => jflatten_strings(v)
    _ => []
  }))
  _
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
error: Expected expression at line 23:44 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:23:44
   |
23 |   JObj(xs) => list.flat_map(xs |> list.map(fn (x) => match x {
   |                                            ^
error: Expected function name at line 23:47 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:23:47
   |
23 |   JObj(xs) => list.flat_map(xs |> list.map(fn (x) => match x {
   |                                               ^
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

11 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

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
  JArr(xs) => list.sum(xs |> list.map(fn (x) => match x {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    _ => 0
  }))
  JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
    (k, v) => match v {
      JNull => 1
      JBool(_) => 1
      JNum(_) => 1
      JStr(_) => 1
      _ => 0
    }
    _ => 0
  }))
}

fn j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 2:29 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:2:29
  |
2 |   JObj(xs) => list.find(xs, fn (x) => match x {
  |                             ^
error: Expected function name at line 2:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:2:32
  |
2 |   JObj(xs) => list.find(xs, fn (x) => match x {
  |                                ^
error: Expected expression at line 13:39 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:13:39
   |
13 |   JArr(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                       ^
error: Expected function name at line 13:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:13:42
   |
13 |   JArr(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                          ^
error: Expected function name at line 20:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:20:42
   |
20 |   JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
   |                                          ^
error: Expected LParen at line 32:5 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:32:5
   |
32 | fn j
   |     ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:44:68
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
44 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:45:68
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
45 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:46:95
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:47:116
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:48:65
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
48 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:42:68
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:42:89
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:46:86
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:47:116
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:47:116
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

16 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
import list

type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

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
  JArr(xs) => list.sum(xs |> list.map(fn (x) => match x {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    _ => 0
  }))
  JObj(xs) => list.sum(xs |> list.map(fn (x) => match x {
    (k, v) => match v {
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:5:58
  in call to jget()
  hint: Check the function name
  |
5 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  |                                                          ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:9:42
  in call to jget()
  hint: Check the function name
  |
9 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  |                                          ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:13:27
  in call to jget()
  hint: Check the function name
   |
13 |   assert_eq(jget(JNum(1), "a"), none)
   |                           ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:17:28
  in call to jget()
  hint: Check the function name
   |
17 |   assert_eq(jget(JObj([]), "a"), none)
   |                            ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:21:25
  in call to jcount()
  hint: Check the function name
   |
21 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:25:20
  in call to jcount()
  hint: Check the function name
   |
25 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:29:25
  in call to jcount()
  hint: Check the function name
   |
29 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:33:49
  in call to jcount()
  hint: Check the function name
   |
33 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:39:16
  in call to jcount()
  hint: Check the function name
   |
39 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:44:25
  in call to jcount()
  hint: Check the function name
   |
44 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:48:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
48 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:52:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
52 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:56:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
56 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:62:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
62 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:67:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
67 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

15 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
