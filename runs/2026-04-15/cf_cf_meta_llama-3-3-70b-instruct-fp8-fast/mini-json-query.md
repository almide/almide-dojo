# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
    JObj(pairs) =>
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(pairs) => list.flat_map(pairs, (pair) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected ')' to close function call opened at line 28:33
  --> /tmp/dojo-mini-json-query-0.almd:30:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
28 |     JObj(pairs) => list.flat_map(pairs, (pair) => j
   |                                 --------------- '(' opened here
...
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

2 error(s) found
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
    JObj(pairs) =>
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(pairs) => list.flat_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:33:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:23:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:23:44
  in call to list.sum()
  hint: Fix the argument type
   |
23 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:24:53
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
   |                                                     ^^^^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:24:53
  in call to list.sum()
  hint: Fix the argument type
   |
24 |     JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
   |                                                     ^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:23:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
23 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:24:53
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
   |                                                     ^^^^

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
    JObj(pairs) =>
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.fold(xs, 0, (acc, x) => acc + jcount(x))
    JObj(pairs) => list.fold(pairs, 0, (acc, pair) => acc + jcount(pair.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close function call opened at line 30:30
  --> /tmp/dojo-mini-json-query-2.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JArr(xs) => list.flat_map(xs, (x) => j
   |                              --------------- '(' opened here
...
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

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

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(pairs) =>
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.fold(xs, 0, (acc, x) => acc + jcount(x))
    JObj(pairs) => list.fold(pairs, 0, (acc, pair) => acc + jcount(pair.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 30:30
  --> /tmp/dojo-mini-json-query-3.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JArr(xs) => list.flat_map(xs, (x) => j
   |                              --------------- '(' opened here
...
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
