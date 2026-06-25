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
      match list.find_index(xs, (k, v) => k == key) {
        some(i) => list.get(xs, i).map(|(k, v)| v)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(xs) => list.sum(list.map(xs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 5:40 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:5:40
  |
5 |         some(i) => list.get(xs, i).map(|(k, v)| v)
  |                                        ^
error: Expected FatArrow at line 13:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:13:11
   |
13 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn(A) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:22:62
  in call to list.flat_map()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:38:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:39:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:40:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:41:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:42:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.flat_map(): expected fn(A) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:22:62
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings(v))
   |                                                              ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:36:68
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:36:89
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:38:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:39:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:40:86
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:40:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:41:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:42:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

19 error(s) found
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
      match list.find_index(xs, (k, v) => k == key) {
        some(i) => match list.get(xs, i) {
          some((k, v)) => some(v)
          none => none
        }
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(xs) => list.sum(list.map(xs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => match v {
      JStr(s) => [s]
      _ => jflatten_strings(v)
    })
    _ => []
  }

effect fn main() ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 16:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:16:11
   |
16 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected type name at line 32:20 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:32:20
   |
32 | effect fn main() ->
   |                    ^
error[E005]: argument 'f' expects fn(A) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:4:48
  in call to list.find_index()
  hint: Fix the argument type
  |
4 |       match list.find_index(xs, (k, v) => k == key) {
  |                                                ^^^
error[E005]: argument 'f' expects fn(A) -> List[B] but got fn(?9, JVal) -> List[Unknown]
  --> /tmp/dojo-mini-json-query-1.almd:27:29
  in call to list.flat_map()
  hint: Fix the argument type
   |
27 |       _ => jflatten_strings(v)
   |                             ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:34:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:35:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
35 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:36:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:37:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
37 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:44:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:45:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
45 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:46:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:47:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:48:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
48 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.find_index(): expected fn(A) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:4:48
  in call to list.find_index()
  hint: Fix the expression type or change the expected type
  |
4 |       match list.find_index(xs, (k, v) => k == key) {
  |                                                ^^^
error[E001]: type mismatch in call to list.flat_map(): expected fn(A) -> List[B] but got fn(?9, JVal) -> List[Unknown]
  --> /tmp/dojo-mini-json-query-1.almd:27:29
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
27 |       _ => jflatten_strings(v)
   |                             ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:34:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-1.almd:34:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:35:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:36:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:37:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
37 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:42:68
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:42:89
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:44:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:45:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:46:86
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:46:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:47:116
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:47:116
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:47:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:48:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

30 error(s) found
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
      match list.find_index(xs, (k, v) => k == key) {
        some(i) => match list.get(xs, i) {
          some((k, v)) => some(v)
          none => none
        }
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(xs) => list.sum(list.map(xs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => match v {
      JStr(s) => [s]
      _ => jflatten_strings(v)
    })
    _ => []
  }

effect fn main() ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 16:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:16:11
   |
16 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected type name at line 32:20 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:32:20
   |
32 | effect fn main() ->
   |                    ^
error[E005]: argument 'f' expects fn(A) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:4:48
  in call to list.find_index()
  hint: Fix the argument type
  |
4 |       match list.find_index(xs, (k, v) => k == key) {
  |                                                ^^^
error[E005]: argument 'f' expects fn(A) -> List[B] but got fn(?9, JVal) -> List[Unknown]
  --> /tmp/dojo-mini-json-query-2.almd:27:29
  in call to list.flat_map()
  hint: Fix the argument type
   |
27 |       _ => jflatten_strings(v)
   |                             ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:34:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:35:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
35 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:36:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:37:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
37 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-2.almd:44:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:45:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
45 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:46:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:47:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:48:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
48 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.find_index(): expected fn(A) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:4:48
  in call to list.find_index()
  hint: Fix the expression type or change the expected type
  |
4 |       match list.find_index(xs, (k, v) => k == key) {
  |                                                ^^^
error[E001]: type mismatch in call to list.flat_map(): expected fn(A) -> List[B] but got fn(?9, JVal) -> List[Unknown]
  --> /tmp/dojo-mini-json-query-2.almd:27:29
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
27 |       _ => jflatten_strings(v)
   |                             ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:34:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-2.almd:34:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:35:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:36:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:37:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
37 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
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
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-2.almd:44:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:45:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:46:86
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:46:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
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
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:47:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:48:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

30 error(s) found
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
      match list.find_index(xs, (k, v) => k == key) {
        some(i) => list.get(xs, i).map((_, v) => v)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(xs) => list.sum(list.map(xs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (k, v) => match v {
      JStr(s) => [s]
      _ => jflatten_strings(v)
    })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 13:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:13:11
   |
13 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn(A) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:4:48
  in call to list.find_index()
  hint: Fix the argument type
  |
4 |       match list.find_index(xs, (k, v) => k == key) {
  |                                                ^^^
error[E005]: argument 'f' expects fn(?5) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-mini-json-query-3.almd:5:33
  in call to option.map()
  hint: Fix the argument type
  |
5 |         some(i) => list.get(xs, i).map((_, v) => v)
  |                                 ^
error[E005]: argument 'f' expects fn(A) -> List[B] but got fn(?9, JVal) -> List[Unknown]
  --> /tmp/dojo-mini-json-query-3.almd:24:29
  in call to list.flat_map()
  hint: Fix the argument type
   |
24 |       _ => jflatten_strings(v)
   |                             ^
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
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:41:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:42:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:43:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:44:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:45:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.find_index(): expected fn(A) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:4:48
  in call to list.find_index()
  hint: Fix the expression type or change the expected type
  |
4 |       match list.find_index(xs, (k, v) => k == key) {
  |                                                ^^^
error[E001]: type mismatch in call to option.map(): expected fn(?5) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-mini-json-query-3.almd:5:33
  in call to option.map()
  hint: Fix the expression type or change the expected type
  |
5 |         some(i) => list.get(xs, i).map((_, v) => v)
  |                                 ^
error[E001]: type mismatch in call to list.flat_map(): expected fn(A) -> List[B] but got fn(?9, JVal) -> List[Unknown]
  --> /tmp/dojo-mini-json-query-3.almd:24:29
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
24 |       _ => jflatten_strings(v)
   |                             ^
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
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:41:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:42:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:43:86
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:43:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
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
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:44:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:45:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

31 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
