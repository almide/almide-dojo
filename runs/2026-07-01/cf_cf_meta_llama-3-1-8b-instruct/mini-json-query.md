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
      if list.some(xs) then
        list.find(xs, (x) => match x {
          (k, v) =>
            if k == key then some(v) else none
        })
      else none
      ,
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(list.map(xs, jcount))
    | JObj(xs) => list.sum(list.map(xs, (x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.from_iter([s])
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected name at line 4:15 (got Some 'some')
  --> /tmp/dojo-mini-json-query-0.almd:4:15
  |
4 |       if list.some(xs) then
  |               ^
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:29:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:41:89
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:45:86
  in list element
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
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
      if list.is_empty(xs) then
        none
      else
        list.find(xs, (x) => match x {
          (k, v) =>
            if k == key then some(v) else none
        })
      ,
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(list.map(xs, jcount))
    | JObj(xs) => list.sum(list.map(xs, (x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.from_iter([s])
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:18:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 30:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:30:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E005]: argument 'f' expects fn((String, ?4)) -> Bool but got fn((String, ?4)) -> Option[?4]
  --> /tmp/dojo-mini-json-query-1.almd:9:43
  in call to list.find()
  hint: Fix the argument type
  |
9 |             if k == key then some(v) else none
  |                                           ^^^^
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
error[E001]: type mismatch in call to list.find(): expected fn((String, ?4)) -> Bool but got fn((String, ?4)) -> Option[?4]
  --> /tmp/dojo-mini-json-query-1.almd:9:43
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
9 |             if k == key then some(v) else none
  |                                           ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Option[(String, ?4)]
  --> /tmp/dojo-mini-json-query-1.almd:12:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
12 |     _ => none
   |          ^^^^
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
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:46:86
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
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

19 error(s) found
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
      })
      ,
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(list.map(xs, jcount))
    | JObj(xs) => list.sum(list.map(xs, (x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.from_iter([s])
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
    })
  }

effect fn main() ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 15:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:15:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 27:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:27:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error: Expected type name at line 33:20 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:33:20
   |
33 | effect fn main() ->
   |                    ^
error[E005]: argument 'f' expects fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:6:41
  in call to list.find()
  hint: Fix the argument type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:35:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:36:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:37:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
37 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:38:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
38 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, ?2)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:6:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
  |
6 |           if k == key then some(v) else none
  |                                         ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Option[(String, ?2)]
  --> /tmp/dojo-mini-json-query-2.almd:9:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  |
9 |     _ => none
  |          ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:35:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-2.almd:35:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:36:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:37:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
37 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-2.almd:38:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
38 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:43:68
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:43:89
  in list element
  hint: Fix the expression type or change the expected type
   |
43 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:47:86
  in list element
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:48:116
  in list element
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:48:116
  in list element
  hint: Fix the expression type or change the expected type
   |
48 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

20 error(s) found
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
      match list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) {
        some(x) => some(x),
        none => none
      }
    | _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(list.map(xs, jcount))
    | JObj(xs) => list.sum(list.map(xs, (x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.from_iter([s])
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | _ => none
   |     ^
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:17:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 29:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:29:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:41:68
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:41:89
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:45:86
  in list element
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:46:116
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:46:116
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
