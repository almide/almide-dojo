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
      list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) |>
      option.unwrap_or_else((_) => none),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount)),
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 22:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:22:11
   |
22 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:34:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-0.almd:14:41
  in call to list.find()
  hint: Fix the argument type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E005]: argument 'f' expects fn() -> (String, JVal) but got fn(?4) -> Option[?5]
  --> /tmp/dojo-mini-json-query-0.almd:16:36
  in call to option.unwrap_or_else()
  hint: Fix the argument type
   |
16 |       option.unwrap_or_else((_) => none),
   |                                    ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:14:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in call to option.unwrap_or_else(): expected fn() -> (String, JVal) but got fn(?4) -> Option[?5]
  --> /tmp/dojo-mini-json-query-0.almd:16:36
  in call to option.unwrap_or_else()
  hint: Fix the expression type or change the expected type
   |
16 |       option.unwrap_or_else((_) => none),
   |                                    ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?6]
  --> /tmp/dojo-mini-json-query-0.almd:17:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
17 |     _ => none
   |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-0.almd:17:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
17 |     _ => none
   |          ^^^^

8 error(s) found
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
      list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) |>
      option.unwrap_or(none),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 22:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:22:11
   |
22 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 35:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:35:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-1.almd:14:41
  in call to list.find()
  hint: Fix the argument type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:14:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-1.almd:16:24
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
16 |       option.unwrap_or(none),
   |                        ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-1.almd:17:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
17 |     _ => none
   |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-1.almd:17:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
17 |     _ => none
   |          ^^^^

7 error(s) found
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
      match list.find(xs, (x) => match x {
        (k, v) =>
          if k == key then some(v) else none
      }) {
        some(x) => some(x),
        none => none
      },
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 24:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:24:11
   |
24 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected ')' to close function call opened at line 34:30
  --> /tmp/dojo-mini-json-query-2.almd:36:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |     JArr(xs) => list.flat_map(xs, jflatten_strings
   |                              --------------- '(' opened here
...
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:14:41
  in call to list.find()
  hint: Fix the argument type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:14:41
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
14 |           if k == key then some(v) else none
   |                                         ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:19:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
19 |     _ => none
   |          ^^^^

5 error(s) found
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
      match list.find(xs, (x) => match x {
        (k, v) => if k == key then some(v) else none
      }) {
        some(x) => some(x),
        none => none
      },
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 23:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:23:11
   |
23 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 35:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:35:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, ?2)) -> Option[?2]
  --> /tmp/dojo-mini-json-query-3.almd:13:49
  in call to list.find()
  hint: Fix the argument type
   |
13 |         (k, v) => if k == key then some(v) else none
   |                                                 ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:13:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
13 |         (k, v) => if k == key then some(v) else none
   |                                                 ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:18:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
18 |     _ => none
   |          ^^^^

5 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
