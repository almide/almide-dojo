# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) >>= (match v {
        JVal => some(v),
        _ => none
      }),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount),
    JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
    _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-0.almd:12:43
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Assignments return Unit and can't appear here at line 12:43
  --> /tmp/dojo-mini-json-query-0.almd:12:43
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:33:76
  in call to jget()
  hint: Check the function name
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:34:64
  in call to jget()
  hint: Check the function name
   |
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:35:47
  in call to jget()
  hint: Check the function name
   |
35 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:36:50
  in call to jget()
  hint: Check the function name
   |
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:37:48
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:38:44
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:39:48
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:40:67
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:41:89
  in call to jcount()
  hint: Check the function name
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:42:49
  in call to jcount()
  hint: Check the function name
   |
42 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:43:68
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:44:68
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:45:95
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:47:65
  in call to jflatten_strings()
  hint: Check the function name
   |
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

19 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) >>= (match v {
        JVal => some(v),
        _ => none
      }),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount),
    JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
    _ => []
  }

effect
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-1.almd:12:43
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Assignments return Unit and can't appear here at line 12:43
  --> /tmp/dojo-mini-json-query-1.almd:12:43
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected Fn at line 34:7 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:34:7
   |
34 | effect
   |       ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-1.almd:30:62
  in call to list.flat_map()
  hint: Fix the argument type
   |
30 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:36:76
  in call to jget()
  hint: Check the function name
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:37:64
  in call to jget()
  hint: Check the function name
   |
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:38:47
  in call to jget()
  hint: Check the function name
   |
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:39:50
  in call to jget()
  hint: Check the function name
   |
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:40:48
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:41:44
  in call to jcount()
  hint: Check the function name
   |
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:42:48
  in call to jcount()
  hint: Check the function name
   |
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:43:67
  in call to jcount()
  hint: Check the function name
   |
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:44:89
  in call to jcount()
  hint: Check the function name
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:45:49
  in call to jcount()
  hint: Check the function name
   |
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-1.almd:30:62
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
30 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^

16 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) >>= (match v {
        JVal => some(v),
        _ => none
      }),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount),
    JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
    _ => []
  }

effect
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-2.almd:12:43
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Assignments return Unit and can't appear here at line 12:43
  --> /tmp/dojo-mini-json-query-2.almd:12:43
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected Fn at line 34:7 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:34:7
   |
34 | effect
   |       ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-2.almd:30:62
  in call to list.flat_map()
  hint: Fix the argument type
   |
30 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:36:76
  in call to jget()
  hint: Check the function name
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:37:64
  in call to jget()
  hint: Check the function name
   |
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:38:47
  in call to jget()
  hint: Check the function name
   |
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:39:50
  in call to jget()
  hint: Check the function name
   |
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:40:48
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:41:44
  in call to jcount()
  hint: Check the function name
   |
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:42:48
  in call to jcount()
  hint: Check the function name
   |
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:43:67
  in call to jcount()
  hint: Check the function name
   |
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:44:89
  in call to jcount()
  hint: Check the function name
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:45:49
  in call to jcount()
  hint: Check the function name
   |
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-2.almd:30:62
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
30 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^

16 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) >>= (match v {
        JVal => some(v),
        _ => none
      }),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount),
    JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
    _ => []
  }

effect
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-3.almd:12:43
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Assignments return Unit and can't appear here at line 12:43
  --> /tmp/dojo-mini-json-query-3.almd:12:43
   |
12 |       list.find(xs, (k, v) => k == key) >>= (match v {
   |                                           ^
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected Fn at line 34:7 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:34:7
   |
34 | effect
   |       ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-3.almd:30:62
  in call to list.flat_map()
  hint: Fix the argument type
   |
30 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:36:76
  in call to jget()
  hint: Check the function name
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:37:64
  in call to jget()
  hint: Check the function name
   |
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:38:47
  in call to jget()
  hint: Check the function name
   |
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:39:50
  in call to jget()
  hint: Check the function name
   |
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:40:48
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:41:44
  in call to jcount()
  hint: Check the function name
   |
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:42:48
  in call to jcount()
  hint: Check the function name
   |
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:43:67
  in call to jcount()
  hint: Check the function name
   |
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:44:89
  in call to jcount()
  hint: Check the function name
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:45:49
  in call to jcount()
  hint: Check the function name
   |
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-3.almd:30:62
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
30 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^

16 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
