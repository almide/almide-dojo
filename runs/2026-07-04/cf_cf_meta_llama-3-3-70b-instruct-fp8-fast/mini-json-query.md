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
      list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs, (_, v) => jflatten_strings(v))
    _ => []
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 30:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:30:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-0.almd:12:49
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-0.almd:12:49
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:79
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                                               ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-0.almd:12:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:79
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                                               ^

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
    JObj(kvs) =>
      list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs, (_, v) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:32:1
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-1.almd:12:49
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((k, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-1.almd:12:49
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((k, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:12:79
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((k, v) => v)
   |                                                                               ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:23:58
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-1.almd:12:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((k, v) => v)
   |                                                 ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-1.almd:12:79
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((k, v) => v)
   |                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:23:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^

8 error(s) found
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
      list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(kvs) => list
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
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-2.almd:12:49
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-2.almd:12:49
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:12:79
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                                               ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:23:58
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-2.almd:12:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-2.almd:12:79
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:23:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^

8 error(s) found
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
      list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(kvs) => list
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
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-3.almd:12:49
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-3.almd:12:49
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:12:79
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                                               ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:23:58
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(?0, ?1) -> Unknown
  --> /tmp/dojo-mini-json-query-3.almd:12:49
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                 ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-3.almd:12:79
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => string.equals(k, key)) |> option.map((_, v) => v)
   |                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:23:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
