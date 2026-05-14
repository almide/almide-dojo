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
    JObj(xs) => list.find(xs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:31:1
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

7 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 29:30
  --> /tmp/dojo-mini-json-query-1.almd:31:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(xs) => list.flat_map(xs, (x) => j
   |                              --------------- '(' opened here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

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
    JObj(xs) => list.find(xs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close function call opened at line 29:30
  --> /tmp/dojo-mini-json-query-2.almd:31:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(xs) => list.flat_map(xs, (x) => j
   |                              --------------- '(' opened here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
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
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

7 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 29:30
  --> /tmp/dojo-mini-json-query-3.almd:31:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(xs) => list.flat_map(xs, (x) => j
   |                              --------------- '(' opened here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
