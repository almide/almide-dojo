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
    JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> option.map((pair) => pair.1)
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
    JObj(pairs) => list.flat_map(pairs, (pair) => jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected ')' to close function call opened at line 26:33
  --> /tmp/dojo-mini-json-query-0.almd:28:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |     JObj(pairs) => list.flat_map(pairs, (pair) => jflatten_strings
   |                                 --------------- '(' opened here
...
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
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
    JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> option.map((pair) => pair.1)
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
    JObj(pairs) => list.flat_map(pairs, (pair) => jflatten_strings(pair.1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 28:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:28:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

2 error(s) found
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
    JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> (x) => option.map((pair) => pair.1)(x)
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
    JObj(pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 29:16 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:29:16
   |
29 |     JObj(pairs)
   |                ^
error[E004]: option.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-2.almd:11:93
  in call to option.map()
  hint: Check the number of arguments
  try:
      // option.map() takes 2 arg(s) — you passed 1
      option.map(<o: Option[A]>, <f: fn(A) -> B>)
   |
11 |     JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> (x) => option.map((pair) => pair.1)(x)
   |                                                                                             ^^^^
error[E005]: argument 'o' expects Option[A] but got fn(?2) -> Unknown
  --> /tmp/dojo-mini-json-query-2.almd:11:93
  in call to option.map()
  hint: Fix the argument type
   |
 4 |   | JNum(Int)
   | ---------------------------- fn option.map() defined here
...
11 |     JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> (x) => option.map((pair) => pair.1)(x)
   |                                                                                             ^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:22:53
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
   |                                                     ^^^^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:53
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
   |                                                     ^^^^
error[E001]: type mismatch in call to option.map(): expected Option[A] but got fn(?2) -> Unknown
  --> /tmp/dojo-mini-json-query-2.almd:11:93
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
11 |     JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> (x) => option.map((pair) => pair.1)(x)
   |                                                                                             ^^^^
error[E001]: type mismatch in function call: expected Option[?4] but got fn(Option[(String, JVal)]) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:11:93
  in function call
  hint: Fix the expression type or change the expected type
   |
11 |     JObj(pairs) => list.find(pairs, (pair) => pair.0 == key) |> (x) => option.map((pair) => pair.1)(x)
   |                                                                                             ^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:53
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(pairs) => list.sum(pairs, (pair) => jcount(pair.1))
   |                                                     ^^^^

11 error(s) found
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
    JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)), 0)
    JObj(pairs) => list.sum(list.map(pairs, (pair) => jcount(pair.1)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 32:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:23:58
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)), 0)
   |                                                          ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:24:72
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (pair) => jcount(pair.1)), 0)
   |                                                                        ^

3 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
