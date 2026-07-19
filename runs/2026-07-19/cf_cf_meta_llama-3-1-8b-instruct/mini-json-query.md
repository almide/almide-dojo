# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(xs) => list.sum(xs.map((x) => jcount(x.1)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
  JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:24:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
24 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:25:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
25 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:26:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
26 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:27:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
   | ---------------------- fn jget() defined here
...
27 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:28:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 6 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
28 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:29:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 6 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
29 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:30:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 6 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
30 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:31:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 6 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
31 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:32:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 6 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:33:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 6 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
33 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:34:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
15 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
34 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:35:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
15 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
35 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:36:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
15 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
36 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:37:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
15 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:38:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
15 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
38 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:24:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
24 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:24:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
24 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:25:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
25 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:26:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
26 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:27:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
27 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:28:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
28 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:29:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
29 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:30:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
30 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:31:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
31 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:32:68
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:32:89
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:32:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:33:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:34:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
34 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:35:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
35 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:36:86
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:36:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:37:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:38:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

36 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => match list.find(xs, (x) => x.0 == key) {
    some(x) => x.1
    none => none
  }
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(xs) => list.sum(xs.map((x) => jcount(x.1)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
  JObj(xs) => list.flat_map(xs, (x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 29:28
  --> /tmp/dojo-mini-json-query-1.almd:31:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   JObj(xs) => list.flat_map(xs, (x)
   |                            --------------- '(' opened here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E001]: type mismatch in match arm: expected JVal but got Option[?1]
  --> /tmp/dojo-mini-json-query-1.almd:12:13
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
12 |     none => none
   |             ^^^^
error[E001]: type mismatch in match arm: expected JVal but got Option[?2]
  --> /tmp/dojo-mini-json-query-1.almd:14:8
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |   _ => none
   |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got JVal
  --> /tmp/dojo-mini-json-query-1.almd:14:8
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
14 |   _ => none
   |        ^^^^

4 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => match list.find(xs, (x) => x.0 == key) {
    some(x) => some(x.1)
    none => none
  }
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(xs) => list.sum(xs.map((x) => jcount(x.1)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
  JObj(xs) => list.flat_map(xs, (x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close parenthesized expression opened at line 29:33
  --> /tmp/dojo-mini-json-query-2.almd:29:35
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
29 |   JObj(xs) => list.flat_map(xs, (x
   |                                 --------------- '(' opened here
   |
29 |   JObj(xs) => list.flat_map(xs, (x
   |                                   ^

1 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => match list.find(xs, (x) => x.0 == key) {
    some(x) => some(x.1)
    none => none
  }
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(xs) => list.sum(xs.map((x) => jcount(x.1)))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
  JObj(xs) => list.flat_map(xs, (x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close parenthesized expression opened at line 29:33
  --> /tmp/dojo-mini-json-query-3.almd:29:35
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
29 |   JObj(xs) => list.flat_map(xs, (x
   |                                 --------------- '(' opened here
   |
29 |   JObj(xs) => list.flat_map(xs, (x
   |                                   ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
