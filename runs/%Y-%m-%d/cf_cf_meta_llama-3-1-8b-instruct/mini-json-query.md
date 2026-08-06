# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => {
    let found = list.find(xs, (x) => match x {
      (k, v) => k == key
    }) |>
    option.unwrap_or_else(() => none[JVal]);
    if found != none[JVal] then found else none[JVal]
  }
  _ => none[JVal]
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, (x) => match x {
    (k, v) => jcount(v)
  })
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 13:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:13:9
   |
13 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:30:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:31:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
31 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:32:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
32 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:33:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
33 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:40:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:42:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
42 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:43:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
43 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:44:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
20 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?2)
  --> /tmp/dojo-mini-json-query-0.almd:9:13
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
9 |   _ => none[JVal]
  |             ^^^^
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

26 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => k == key
  }) |> option.map((x) => match x {
    (k, v) => v
  }) |> option.unwrap_or_else(() => none[JVal])
  _ => none[JVal]
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, (x) => match x {
    (k, v) => jcount(v)
  })
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 11:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:9
   |
11 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:28:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:29:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
29 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:30:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
30 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:31:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
31 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:38:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:39:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:40:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:41:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:42:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:28:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-1.almd:28:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:29:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
29 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:30:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
30 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:31:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:36:68
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:36:89
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-1.almd:38:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:39:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:40:86
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:40:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-1.almd:41:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-1.almd:42:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

25 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => k == key
  }) |> option.map((x) => match x {
    (k, v) => v
  }) |> option.unwrap_or_else(() => none[JVal])
  JObj(_) => none[JVal]
  _ => match obj {
    JNum(_) | JBool(_) | JStr(_) => none[JVal]
    JArr(_) => none[JVal]
  }
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, (x) => match x {
    (k, v) => jcount(v)
  })
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 9:13 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:9:13
  |
9 |     JNum(_) | JBool(_) | JStr(_) => none[JVal]
  |             ^
error: Expected FatArrow at line 15:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:15:9
   |
15 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error: Expected expression at line 27:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:27:1
   |
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
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
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => k == key
  }) |> option.map((x) => match x {
    (k, v) => v
  })
  _ => none[JVal]
}

fn jcount(val: JVal) -> Int = match val {
  JNull | JBool(_) | JNum(_) | JStr(_) => 1
  JArr(xs) => list.sum(xs, jcount)
  JObj(xs) => list.sum(xs, (x) => match x {
    (k, v) => jcount(v)
  })
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 11:9 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:9
   |
11 |   JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |         ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:28:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:29:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
29 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:30:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
30 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:31:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
31 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:38:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:39:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:40:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:41:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:42:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
18 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:28:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-3.almd:28:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:29:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
29 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:30:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
30 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:31:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
31 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:36:68
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:36:89
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:38:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:39:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:40:86
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:40:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:41:116
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:41:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:42:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
42 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

25 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
