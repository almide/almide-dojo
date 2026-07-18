# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = 
  match obj {
    JObj(xs) => 
      xs.find((x) => match x {
        (k, v) => if k == key then some(v) else none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs.sum((x) => jcount(x))
    JObj(xs) => xs.sum((x) => jcount(x.first._2))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(xs) => xs.flat_map((x) => jflatten_strings(x._2))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:30:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:31:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:32:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:33:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:34:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
34 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:35:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
35 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:36:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
36 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:37:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
37 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:38:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:39:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
39 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:40:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:42:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:43:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:44:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:30:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:30:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:31:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:32:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:33:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:34:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:35:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:36:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:37:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
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
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:38:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:39:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:40:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:42:86
  in list element
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:42:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
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
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:43:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:44:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

36 error(s) found
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
      xs.find((x) => match x {
        (k, v) => if k == key then some(v) else none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs.sum((x) => jcount(x))
    JObj(xs) => xs.sum((x) => match x._2 {
      JNull => 1
      JBool(_) => 1
      JNum(_) => 1
      JStr(_) => 1
      JArr(yxs) => yxs.sum((y) => jcount(y))
      JObj(yxs) => yxs.sum((y) => jcount(y.first._2))
      _ => 0
    })
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 30:9 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:30:9
   |
30 |     JStr
   |         ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:32:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:33:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
33 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:34:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
34 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:35:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
35 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:36:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
36 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:37:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
37 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:38:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
38 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:39:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
39 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:40:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
40 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:41:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
10 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
41 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:32:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-1.almd:32:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:33:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:34:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:35:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:36:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:37:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
37 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:38:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
38 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:39:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
39 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:40:68
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:40:89
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:40:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
40 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:41:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:44:86
  in list element
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:45:116
  in list element
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:45:116
  in list element
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

27 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
import string

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
      xs.find((x) => match x {
        (k, v) => if k == key then some(v) else none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs.sum((x) => jcount(x))
    JObj(xs) => xs.sum((x) => match x._2 {
      JNull => 1
      JBool(_) => 1
      JNum(_) => 1
      JStr(_) => 1
      JArr(yxs) => yxs.sum((y) => jcount(y))
      JObj(yxs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:5:15
  in call to list.find()
  hint: Fix the argument type
  |
5 |   JObj(xs) => xs.find((x) => match x {
  |               ^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:28:25
  in call to jcount()
  hint: Check the function name
   |
28 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:32:20
  in call to jcount()
  hint: Check the function name
   |
32 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:36:25
  in call to jcount()
  hint: Check the function name
   |
36 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:40:49
  in call to jcount()
  hint: Check the function name
   |
40 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:46:16
  in call to jcount()
  hint: Check the function name
   |
46 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:51:25
  in call to jcount()
  hint: Check the function name
   |
51 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:55:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
55 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:59:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
59 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:63:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
63 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:69:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
69 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:74:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
74 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:5:15
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
5 |   JObj(xs) => xs.find((x) => match x {
  |               ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-2.almd:7:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |   }) |> option.unwrap_or(none),
  |                          ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-2.almd:8:8
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-2.almd:8:8
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
8 |   _ => none,
  |        ^^^^

16 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
import string

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
      xs.find((x) => match x {
        (k, v) => if k == key then some(v) else none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs.sum((x) => jcount(x))
    JObj(xs) => xs.sum((x) => match x._2 {
      JNull => 1
      JBool(_) => 1
      JNum(_) => 1
      JStr(_) => 1
      JArr(yxs) => yxs.sum((y) => jcount(y))
      JObj(yxs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-3.almd:5:15
  in call to list.find()
  hint: Fix the argument type
  |
5 |   JObj(xs) => xs.find((x) => match x {
  |               ^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:28:25
  in call to jcount()
  hint: Check the function name
   |
28 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:32:20
  in call to jcount()
  hint: Check the function name
   |
32 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:36:25
  in call to jcount()
  hint: Check the function name
   |
36 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:40:49
  in call to jcount()
  hint: Check the function name
   |
40 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:46:16
  in call to jcount()
  hint: Check the function name
   |
46 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:51:25
  in call to jcount()
  hint: Check the function name
   |
51 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:55:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
55 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:59:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
59 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:63:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
63 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:69:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
69 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:74:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
74 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:5:15
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
5 |   JObj(xs) => xs.find((x) => match x {
  |               ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-3.almd:7:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |   }) |> option.unwrap_or(none),
  |                          ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-3.almd:8:8
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-3.almd:8:8
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
8 |   _ => none,
  |        ^^^^

16 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
