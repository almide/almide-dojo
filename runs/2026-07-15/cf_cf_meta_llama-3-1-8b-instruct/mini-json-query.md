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
      list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) |>
      option.unwrap_or_else(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
    })
    _ => []
  }

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LParen at line 34:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:34:15
   |
34 | effect fn main
   |               ^
error[E005]: argument 'f' expects fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-0.almd:6:41
  in call to list.find()
  hint: Fix the argument type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E005]: argument 'f' expects fn() -> (String, ?2) but got Option[?4]
  --> /tmp/dojo-mini-json-query-0.almd:8:29
  in call to option.unwrap_or_else()
  hint: Fix the argument type
  |
8 |       option.unwrap_or_else(none)
  |                             ^^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:36:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:37:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:38:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:39:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:40:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:41:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:42:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:43:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:44:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:45:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:46:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:47:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:48:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:49:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:50:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.find(): expected fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-0.almd:6:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E001]: type mismatch in call to option.unwrap_or_else(): expected fn() -> (String, ?2) but got Option[?4]
  --> /tmp/dojo-mini-json-query-0.almd:8:29
  in call to option.unwrap_or_else()
  hint: Fix the expression type or change the expected type
  |
8 |       option.unwrap_or_else(none)
  |                             ^^^^
error[E001]: type mismatch in match arm: expected (String, ?2) but got Option[?5]
  --> /tmp/dojo-mini-json-query-0.almd:9:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?2)
  --> /tmp/dojo-mini-json-query-0.almd:9:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:36:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:36:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:37:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:38:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:39:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:40:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:41:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:42:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:43:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:44:68
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:44:89
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:44:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:45:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:46:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:47:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:48:86
  in list element
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:48:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:49:116
  in list element
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:49:116
  in list element
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:49:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:50:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

43 error(s) found
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
      list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) |>
      option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
    })
    _ => []
  }

effect fn main()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected Arrow at line 34:17 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:34:17
   |
34 | effect fn main()
   |                 ^
error[E005]: argument 'f' expects fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-1.almd:6:41
  in call to list.find()
  hint: Fix the argument type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:36:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:37:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:38:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:39:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:40:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:41:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:42:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:43:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:44:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:45:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:46:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:47:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:48:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:49:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:50:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.find(): expected fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-1.almd:6:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, ?2) but got Option[?4]
  --> /tmp/dojo-mini-json-query-1.almd:8:24
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       option.unwrap_or(none)
  |                        ^^^^
error[E001]: type mismatch in match arm: expected (String, ?2) but got Option[?5]
  --> /tmp/dojo-mini-json-query-1.almd:9:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?2)
  --> /tmp/dojo-mini-json-query-1.almd:9:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:36:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-1.almd:36:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:37:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:38:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:39:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:40:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:41:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:42:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:43:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:44:68
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:44:89
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:44:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:45:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:46:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:47:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:48:86
  in list element
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:48:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:49:116
  in list element
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:49:116
  in list element
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:49:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:50:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

42 error(s) found
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
      list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) |>
      option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
    })
    _ => []
  }

effect fn main()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected Arrow at line 34:17 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:34:17
   |
34 | effect fn main()
   |                 ^
error[E005]: argument 'f' expects fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:6:41
  in call to list.find()
  hint: Fix the argument type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:36:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:37:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:38:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:39:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:40:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:41:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-2.almd:42:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:43:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:44:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:45:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-2.almd:46:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:47:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:48:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:49:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:50:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.find(): expected fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:6:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, ?2) but got Option[?4]
  --> /tmp/dojo-mini-json-query-2.almd:8:24
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       option.unwrap_or(none)
  |                        ^^^^
error[E001]: type mismatch in match arm: expected (String, ?2) but got Option[?5]
  --> /tmp/dojo-mini-json-query-2.almd:9:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?2)
  --> /tmp/dojo-mini-json-query-2.almd:9:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:36:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-2.almd:36:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:37:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:38:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
38 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:39:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
39 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:40:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
40 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:41:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-2.almd:42:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
42 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:43:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
43 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:44:68
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:44:89
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:44:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
44 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:45:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
45 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-2.almd:46:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:47:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:48:86
  in list element
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:48:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:49:116
  in list element
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:49:116
  in list element
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:49:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-2.almd:50:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

42 error(s) found
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
      list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) |>
      option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 35:30
  --> /tmp/dojo-mini-json-query-3.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |     JArr(xs) => list.flat_map(xs
   |                              --------------- '(' opened here
...
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-3.almd:14:41
  in call to list.find()
  hint: Fix the argument type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:14:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-3.almd:16:24
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
16 |       option.unwrap_or(none)
   |                        ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-3.almd:17:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
17 |     _ => none
   |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-3.almd:17:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
17 |     _ => none
   |          ^^^^

6 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
