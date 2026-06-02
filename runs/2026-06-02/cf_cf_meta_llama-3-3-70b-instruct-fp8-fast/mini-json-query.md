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
    JObj(fields) =>
      list.find(fields, (k, _) => k == key) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(children) => list.sum(children, (x) => jcount(x))
    JObj(fields) => list.sum(fields, (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) => list.flat_map(children, (x) => jflatten_strings(x))
    JObj(fields) => list.flat_map(fields, (_, v) => jflatten_strings(v))
    _ => []
  }

effect
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected Fn at line 31:7 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:31:7
   |
31 | effect
   |       ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:40
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, _) => k == key) |> option.map((_, v) => v)
   |                                        ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:69
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, _) => k == key) |> option.map((_, v) => v)
   |                                                                     ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?7, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:27:70
  in call to list.flat_map()
  hint: Fix the argument type
   |
27 |     JObj(fields) => list.flat_map(fields, (_, v) => jflatten_strings(v))
   |                                                                      ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:40
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, _) => k == key) |> option.map((_, v) => v)
   |                                        ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:69
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, _) => k == key) |> option.map((_, v) => v)
   |                                                                     ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?7, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:27:70
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
27 |     JObj(fields) => list.flat_map(fields, (_, v) => jflatten_strings(v))
   |                                                                      ^

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
    JObj(fields) =>
      list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(children) => list.sum(children, (x) => jcount(x))
    JObj(fields) => list.sum(fields, (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) => list.flat_map(children, (x) => jflatten_strings(x))
    JObj(fields) => list.flat_map(fields, (_, v) => jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 30:34
  --> /tmp/dojo-mini-json-query-1.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JObj(fields) => list.flat_map(fields, (_, v) => jflatten_strings
   |                                  --------------- '(' opened here
...
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:40
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                        ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:12:69
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                                                     ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:22:56
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JArr(children) => list.sum(children, (x) => jcount(x))
   |                                                        ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:22:56
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JArr(children) => list.sum(children, (x) => jcount(x))
   |                                                        ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:23:55
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JObj(fields) => list.sum(fields, (_, v) => jcount(v))
   |                                                       ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:23:55
  in call to list.sum()
  hint: Fix the argument type
   |
23 |     JObj(fields) => list.sum(fields, (_, v) => jcount(v))
   |                                                       ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:40
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                        ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:12:69
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                                                     ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:22:56
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JArr(children) => list.sum(children, (x) => jcount(x))
   |                                                        ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:23:55
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(fields) => list.sum(fields, (_, v) => jcount(v))
   |                                                       ^

11 error(s) found
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
    JObj(fields) =>
      list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(children) => list.sum(list.map(children, (x) => jcount(x)), 0)
    JObj(fields) => list.sum(list.map(fields, (_, v) => jcount(v)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) => list.flat_map(children, (x) => jflatten_strings(x))
    JObj(fields
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected RParen at line 30:16 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:30:16
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
30 |     JObj(fields
   |                ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:40
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                        ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:12:69
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                                                     ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:22:70
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JArr(children) => list.sum(list.map(children, (x) => jcount(x)), 0)
   |                                                                      ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:23:64
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(fields) => list.sum(list.map(fields, (_, v) => jcount(v)), 0)
   |                                                                ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:23:69
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JObj(fields) => list.sum(list.map(fields, (_, v) => jcount(v)), 0)
   |                                                                     ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:40
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                        ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:12:69
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((_, v) => v)
   |                                                                     ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:23:64
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(fields) => list.sum(list.map(fields, (_, v) => jcount(v)), 0)
   |                                                                ^

9 error(s) found
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
    JObj(fields) =>
      list.find(fields, (k, v) => k == key) |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(children) => list.sum(list.map(children, (x) => jcount(x)))
    JObj(fields) => list.sum(list.map(fields, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) => list.flat_map(children, (x) => jflatten_strings(x))
    JObj(fields) => list
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
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:40
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((k, v) => v)
   |                                        ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:12:69
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((k, v) => v)
   |                                                                     ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:23:64
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(fields) => list.sum(list.map(fields, (k, v) => jcount(v)))
   |                                                                ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:40
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((k, v) => v)
   |                                        ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:12:69
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(fields, (k, v) => k == key) |> option.map((k, v) => v)
   |                                                                     ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:23:64
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(fields) => list.sum(list.map(fields, (k, v) => jcount(v)))
   |                                                                ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
