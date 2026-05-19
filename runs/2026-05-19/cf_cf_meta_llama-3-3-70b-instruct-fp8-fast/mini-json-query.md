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
      list.find(pairs, (k, v) => k == key)
      |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) =>
      list.map(xs, jcount)
      |> list.sum
    JObj(pairs) =>
      list.map(pairs, (_, v) => jcount(v))
      |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map(xs, jflatten_strings)
    JObj(pairs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected RParen at line 36:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:36:15
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
36 |     JObj(pairs
   |               ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:39
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (k, v) => k == key)
   |                                       ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:13:31
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:27:40
  in call to list.map()
  hint: Fix the argument type
   |
27 |       list.map(pairs, (_, v) => jcount(v))
   |                                        ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:39
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (k, v) => k == key)
   |                                       ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:13:31
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:27:40
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
27 |       list.map(pairs, (_, v) => jcount(v))
   |                                        ^

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
    JObj(pairs) =>
      list.find(pairs, (pair_k, pair_v) => pair_k == key)
      |> option.map((pair_k, pair_v) => pair_v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) =>
      list.map(xs, jcount)
      |> list.sum
    JObj(pairs) =>
      list.map(pairs, (pair_k, pair_v) => jcount(pair_v))
      |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map(xs, jflatten
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 35:20
  --> /tmp/dojo-mini-json-query-1.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |       list.flat_map(xs, jflatten
   |                    --------------- '(' opened here
...
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:54
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (pair_k, pair_v) => pair_k == key)
   |                                                      ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:13:41
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:27:50
  in call to list.map()
  hint: Fix the argument type
   |
27 |       list.map(pairs, (pair_k, pair_v) => jcount(pair_v))
   |                                                  ^^^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:54
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (pair_k, pair_v) => pair_k == key)
   |                                                      ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:13:41
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:27:50
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
27 |       list.map(pairs, (pair_k, pair_v) => jcount(pair_v))
   |                                                  ^^^^^^

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
      list.find(pairs, (pair_k, pair_v) => pair_k == key)
      |> option.map((pair_k, pair_v) => pair_v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) =>
      list.sum(list.map(xs, jcount))
    JObj(pairs) =>
      list.sum(list.map(pairs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map(xs, jflatten_strings)
    JObj
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 34:9 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:34:9
   |
34 |     JObj
   |         ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:54
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (pair_k, pair_v) => pair_k == key)
   |                                                      ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:13:41
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:26:49
  in call to list.map()
  hint: Fix the argument type
   |
26 |       list.sum(list.map(pairs, (k, v) => jcount(v)))
   |                                                 ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:54
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (pair_k, pair_v) => pair_k == key)
   |                                                      ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:13:41
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((pair_k, pair_v) => pair_v)
   |                                         ^^^^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:26:49
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
26 |       list.sum(list.map(pairs, (k, v) => jcount(v)))
   |                                                 ^

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
    JObj(pairs) =>
      list.find(pairs, (k, v) => k == key)
      |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) =>
      list.sum(list.map(xs, (x) => jcount(x)))
    JObj(pairs) =>
      list.sum(list.map(pairs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map(xs, (x) => jflatten_strings(x))
    JObj
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 34:9 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:34:9
   |
34 |     JObj
   |         ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:39
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(pairs, (k, v) => k == key)
   |                                       ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:13:31
  in call to option.map()
  hint: Fix the argument type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:26:49
  in call to list.map()
  hint: Fix the argument type
   |
26 |       list.sum(list.map(pairs, (k, v) => jcount(v)))
   |                                                 ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:39
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(pairs, (k, v) => k == key)
   |                                       ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:13:31
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
13 |       |> option.map((k, v) => v)
   |                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:26:49
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
26 |       list.sum(list.map(pairs, (k, v) => jcount(v)))
   |                                                 ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
