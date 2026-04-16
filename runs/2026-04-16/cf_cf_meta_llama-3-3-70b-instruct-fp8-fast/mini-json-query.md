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
    JObj(kvs) => 
      list.find(kvs, (k, v) => k == key) 
      |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vs) => list.sum(vs, jcount)
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => v), jcount)
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(vs) => list.flat_map(vs, jflatten_strings)
    JObj(kvs) => list.flat_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:33:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:13:31
  in call to option.map()
  hint: Fix the argument type
   |
 4 |   | JNum(Int)
   | ---------------------------- fn option.map() defined here
...
13 |       |> option.map((k, v) => v)
   |                               ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:23:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(vs) => list.sum(vs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:23:30
  in call to list.sum()
  hint: Fix the argument type
   |
23 |     JArr(vs) => list.sum(vs, jcount)
   |                              ^^^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, ?7) -> ?7
  --> /tmp/dojo-mini-json-query-0.almd:24:51
  in call to list.map()
  hint: Fix the argument type
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => v), jcount)
   |                                                   ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:24:55
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => v), jcount)
   |                                                       ^^^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key)
   |                                     ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:13:31
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:23:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
23 |     JArr(vs) => list.sum(vs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, ?7) -> ?7
  --> /tmp/dojo-mini-json-query-0.almd:24:51
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => v), jcount)
   |                                                   ^

11 error(s) found
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
    JObj(kvs) => 
      list.find(kvs, (kv) => kv.0 == key) 
      |> option.map((kv) => kv.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vs) => list.sum(list.map(vs, jcount), 0)
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(vs) => list.flat_map(vs, jflatten_strings)
    JObj(kvs) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:23:48
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(vs) => list.sum(list.map(vs, jcount), 0)
   |                                                ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:24:58
  in call to list.map()
  hint: Fix the argument type
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)), 0)
   |                                                          ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:24:63
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)), 0)
   |                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:24:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)), 0)
   |                                                          ^

5 error(s) found
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
    JObj(kvs) => 
      list.find(kvs, (kv) => kv.0 == key) 
      |> option.map((kv) => kv.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vs) => list.sum(list.map(vs, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(vs) => list.flat_map(vs, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:24:58
  in call to list.map()
  hint: Fix the argument type
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:24:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^

3 error(s) found
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
    JObj(kvs) => 
      list.find(kvs, (kv) => kv.0 == key) 
      |> option.map((kv) => kv.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vs) => list.sum(list.map(vs, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (kv) => jcount(kv.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(vs) => list.flat_map(vs, jflatten_strings)
    JObj(kvs) => list.flat_map(k
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 31:31
  --> /tmp/dojo-mini-json-query-3.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |     JObj(kvs) => list.flat_map(k
   |                               --------------- '(' opened here
...
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
