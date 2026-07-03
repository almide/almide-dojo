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
      list.find(pairs, (k, _) => k == key) 
      |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount), 0)
    JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (_, v) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 30:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:30:1
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:39
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (k, _) => k == key)
   |                                       ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:13:31
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((_, v) => v)
   |                               ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:39
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (k, _) => k == key)
   |                                       ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:13:31
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((_, v) => v)
   |                               ^

6 error(s) found
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
      list.find(pairs, (k, _) => k == key) 
      |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount), 0)
    JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list
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
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:39
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (k, _) => k == key)
   |                                       ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:13:31
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:23:48
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(xs) => list.sum(list.map(xs, jcount), 0)
   |                                                ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:24:62
  in call to list.map()
  hint: Fix the argument type
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
   |                                                              ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:24:67
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
   |                                                                   ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:39
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (k, _) => k == key)
   |                                       ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:13:31
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:24:62
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
   |                                                              ^

9 error(s) found
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
      list.find(pairs, (pair_k, _) => pair_k == key) 
      |> option.map((pair_k, pair_v) => pair_v)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)), 0)
    JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 32:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:49
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (pair_k, _) => pair_k == key)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:13:41
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:23:58
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)), 0)
   |                                                          ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:24:62
  in call to list.map()
  hint: Fix the argument type
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
   |                                                              ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:24:67
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
   |                                                                   ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (pair_k, _) => pair_k == key)
   |                                                 ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:13:41
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:24:62
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)), 0)
   |                                                              ^

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
    JObj(pairs) => 
      list.find(pairs, (pair_k, _) => pair_k == key) 
      |> option.map((pair_k, pair_v) => pair_v)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)))
    JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 30:58
  --> /tmp/dojo-mini-json-query-3.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x
   |                                                          --------------- '(' opened here
...
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:49
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (pair_k, _) => pair_k == key)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:13:41
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:24:62
  in call to list.map()
  hint: Fix the argument type
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)))
   |                                                              ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (pair_k, _) => pair_k == key)
   |                                                 ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:13:41
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:24:62
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)))
   |                                                              ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
