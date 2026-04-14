# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, (x) => jcount(x))
    | JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    | JObj(xs) => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
   |     ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:35:48
  in call to jcount()
  hint: Check the function name
   |
35 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:36:44
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:37:48
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:38:67
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:39:89
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:40:49
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:43:95
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:44:116
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:45:65
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

13 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, (x) => jcount(x))
    | JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    | JObj(xs) => list.flat_map(xs,
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
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
   |     ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:35:48
  in call to jcount()
  hint: Check the function name
   |
35 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:36:44
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:37:48
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:38:67
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:39:89
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:40:49
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:43:95
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:44:116
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:45:65
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

13 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, (x) => match x {
      JNull => 1
      | JBool(_) => 1
      | JNum(_) => 1
      | JStr(_) => 1
      | JArr(xs) => jcount(JArr(xs))
      | JObj(xs) => jcount(JObj(xs))
    })
    | JObj(xs) => list.sum(xs, (x) => match x.1 {
      J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:18:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | JBool(_) => 1
   |     ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:36:48
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:37:44
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:38:48
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:39:67
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:40:89
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:41:49
  in call to jcount()
  hint: Check the function name
   |
41 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:43:68
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:44:95
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:45:116
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:46:65
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

12 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, (x) => match x {
      JNull => 1
      | JBool(_) => 1
      | JNum(_) => 1
      | JStr(_) => 1
      | JArr(xs) => jcount(JArr(xs))
      | JObj(xs) => jcount(JObj(xs))
    })
    | JObj(xs) => list.sum(xs, (x) => match x.1 {
      J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 18:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:18:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |     | JBool(_) => 1
   |     ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:36:48
  in call to jcount()
  hint: Check the function name
   |
36 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:37:44
  in call to jcount()
  hint: Check the function name
   |
37 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:38:48
  in call to jcount()
  hint: Check the function name
   |
38 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:39:67
  in call to jcount()
  hint: Check the function name
   |
39 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:40:89
  in call to jcount()
  hint: Check the function name
   |
40 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:41:49
  in call to jcount()
  hint: Check the function name
   |
41 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:43:68
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:44:95
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:45:116
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:46:65
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

12 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
