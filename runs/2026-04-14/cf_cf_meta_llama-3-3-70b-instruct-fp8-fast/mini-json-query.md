# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

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
    case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
    case _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    case JNull | JBool(_) | JNum(_) | JStr(_) => 1
    case JArr(vs) => vs.map(jcount).fold(0, (acc, x) => acc + x)
    case JObj(kvs) => kvs.map((_, v) => jcount(v)).fold(0, (acc, x) => acc + x)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    case JStr(s) => [s]
    case JArr(vs) => vs.flat_map(jflatten_strings)
    case JObj(kvs) => k
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 11:10 (got TypeName 'JObj')
  --> /tmp/dojo-mini-json-query-0.almd:11:10
   |
11 |     case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
   |          ^
error: Expected FatArrow at line 17:10 (got TypeName 'JNull')
  --> /tmp/dojo-mini-json-query-0.almd:17:10
   |
17 |     case JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |          ^
error: Expected FatArrow at line 24:10 (got TypeName 'JStr')
  --> /tmp/dojo-mini-json-query-0.almd:24:10
   |
24 |     case JStr(s) => [s]
   |          ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:28:76
  in call to jget()
  hint: Check the function name
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:29:64
  in call to jget()
  hint: Check the function name
   |
29 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:30:47
  in call to jget()
  hint: Check the function name
   |
30 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:31:50
  in call to jget()
  hint: Check the function name
   |
31 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:32:48
  in call to jcount()
  hint: Check the function name
   |
32 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:33:44
  in call to jcount()
  hint: Check the function name
   |
33 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:34:48
  in call to jcount()
  hint: Check the function name
   |
34 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:35:67
  in call to jcount()
  hint: Check the function name
   |
35 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:36:89
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:37:49
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:38:68
  in call to jflatten_strings()
  hint: Check the function name
   |
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:39:68
  in call to jflatten_strings()
  hint: Check the function name
   |
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:40:95
  in call to jflatten_strings()
  hint: Check the function name
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:41:116
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:42:65
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

18 error(s) found
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
    case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
    case _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    case JNull => 1
    case JBool(_) => 1
    case JNum(_) => 1
    case JStr(_) => 1
    case JArr(vs) => vs.map(jcount).fold(0, (acc, x) => acc + x)
    case JObj(kvs) => kvs.map((_, v) => jcount(v)).fold(0, (acc, x) => acc + x)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    case JStr(s) => [s]
    case JArr(vs) => vs.flat_map(j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 11:10 (got TypeName 'JObj')
  --> /tmp/dojo-mini-json-query-1.almd:11:10
   |
11 |     case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
   |          ^
error: Expected FatArrow at line 17:10 (got TypeName 'JNull')
  --> /tmp/dojo-mini-json-query-1.almd:17:10
   |
17 |     case JNull => 1
   |          ^
error: Expected FatArrow at line 27:10 (got TypeName 'JStr')
  --> /tmp/dojo-mini-json-query-1.almd:27:10
   |
27 |     case JStr(s) => [s]
   |          ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:30:76
  in call to jget()
  hint: Check the function name
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:31:64
  in call to jget()
  hint: Check the function name
   |
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:32:47
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:33:50
  in call to jget()
  hint: Check the function name
   |
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:34:48
  in call to jcount()
  hint: Check the function name
   |
34 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:35:44
  in call to jcount()
  hint: Check the function name
   |
35 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:36:48
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:37:67
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:38:89
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:39:49
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:40:68
  in call to jflatten_strings()
  hint: Check the function name
   |
40 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:42:95
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:43:116
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:44:65
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

18 error(s) found
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
    case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
    case _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    case JNull => 1
    case JBool(_) => 1
    case JNum(_) => 1
    case JStr(_) => 1
    case JArr(vs) => vs.map(jcount).fold(0, (acc, x) => acc + x)
    case JObj(kvs) => kvs.map((_, v) => jcount(v)).fold(0, (acc, x) => acc + x)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    case JStr(s) => [s]
    case JArr(vs) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 11:10 (got TypeName 'JObj')
  --> /tmp/dojo-mini-json-query-2.almd:11:10
   |
11 |     case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
   |          ^
error: Expected FatArrow at line 17:10 (got TypeName 'JNull')
  --> /tmp/dojo-mini-json-query-2.almd:17:10
   |
17 |     case JNull => 1
   |          ^
error: Expected FatArrow at line 27:10 (got TypeName 'JStr')
  --> /tmp/dojo-mini-json-query-2.almd:27:10
   |
27 |     case JStr(s) => [s]
   |          ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:30:76
  in call to jget()
  hint: Check the function name
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:31:64
  in call to jget()
  hint: Check the function name
   |
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:32:47
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:33:50
  in call to jget()
  hint: Check the function name
   |
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:34:48
  in call to jcount()
  hint: Check the function name
   |
34 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:35:44
  in call to jcount()
  hint: Check the function name
   |
35 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:36:48
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:37:67
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:38:89
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:39:49
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:40:68
  in call to jflatten_strings()
  hint: Check the function name
   |
40 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:42:95
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:43:116
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:44:65
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

18 error(s) found
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
    case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
    case _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    case JNull => 1
    case JBool(_) => 1
    case JNum(_) => 1
    case JStr(_) => 1
    case JArr(vs) => vs.map(jcount).fold(0, (acc, x) => acc + x)
    case JObj(kvs) => kvs.map((_, v) => jcount(v)).fold(0, (acc, x) => acc + x)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    case JStr(s) => [s]
    case JArr(vs) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 11:10 (got TypeName 'JObj')
  --> /tmp/dojo-mini-json-query-3.almd:11:10
   |
11 |     case JObj(kvs) => kvs.find((k, _) => k == key).map((_, v) => v)
   |          ^
error: Expected FatArrow at line 17:10 (got TypeName 'JNull')
  --> /tmp/dojo-mini-json-query-3.almd:17:10
   |
17 |     case JNull => 1
   |          ^
error: Expected FatArrow at line 27:10 (got TypeName 'JStr')
  --> /tmp/dojo-mini-json-query-3.almd:27:10
   |
27 |     case JStr(s) => [s]
   |          ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:30:76
  in call to jget()
  hint: Check the function name
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:31:64
  in call to jget()
  hint: Check the function name
   |
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:32:47
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:33:50
  in call to jget()
  hint: Check the function name
   |
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:34:48
  in call to jcount()
  hint: Check the function name
   |
34 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:35:44
  in call to jcount()
  hint: Check the function name
   |
35 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:36:48
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:37:67
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:38:89
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:39:49
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:40:68
  in call to jflatten_strings()
  hint: Check the function name
   |
40 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:42:95
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:43:116
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:44:65
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

18 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
