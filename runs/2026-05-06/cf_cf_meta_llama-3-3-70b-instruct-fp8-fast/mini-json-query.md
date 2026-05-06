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
      list.find(kvs, (k, v) => k == key).map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) =>
      list.sum(list.map(vals, jcount))
    JObj(kvs) =>
      list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(vals) =>
      list.flat_map(vals, jflatten_strings)
    JObj(kvs) =>
      list.flat_map(kvs,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 36:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:36:1
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:25:47
  in call to list.map()
  hint: Fix the argument type
   |
25 |       list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                               ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?6, JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:25:47
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
25 |       list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                               ^

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
      list.find(kvs, (k, v) => k == key).map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) =>
      list.sum(list.map(vals, (x) => jcount(x)))
    JObj(kvs) =>
      list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(vals) =>
      list.flat_map(vals, (x) => jflatten_strings(x))
    JObj(k
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected RParen at line 33:11 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:33:11
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
33 |     JObj(k
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:37
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-1.almd:12:37
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:25:47
  in call to list.map()
  hint: Fix the argument type
   |
25 |       list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                               ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:37
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-1.almd:12:37
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:25:47
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
25 |       list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                               ^

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
    JObj(kvs) =>
      list.find(kvs, (k, v) => k == key).map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) =>
      list.sum(list.map(vals, (x) => jcount(x)))
    JObj(kvs) =>
      list.sum(list.map(kvs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(vals) =>
      list.flat_map(vals, (x) => jflatten_strings(x))
    J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 33:6 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:33:6
   |
33 |     J
   |      ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:37
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-2.almd:12:37
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:25:47
  in call to list.map()
  hint: Fix the argument type
   |
25 |       list.sum(list.map(kvs, (k, v) => jcount(v)))
   |                                               ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:37
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-2.almd:12:37
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:25:47
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
25 |       list.sum(list.map(kvs, (k, v) => jcount(v)))
   |                                               ^

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
    JObj(kvs) =>
      list.find(kvs, (k, v) => k == key).map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) =>
      list.sum(list.map(vals, (x) => jcount(x)))
    JObj(kvs) =>
      list.sum(list.map(kvs, (k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(vals) =>
      list.flat_map(vals, (x) => jflatten_strings(x))
    JObj(kvs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 33:14 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:33:14
   |
33 |     JObj(kvs)
   |              ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:37
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-3.almd:12:37
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:25:47
  in call to list.map()
  hint: Fix the argument type
   |
25 |       list.sum(list.map(kvs, (k, v) => jcount(v)))
   |                                               ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?3) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:37
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?0, ?1) -> ?1
  --> /tmp/dojo-mini-json-query-3.almd:12:37
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key).map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?7, JVal) -> Int
  --> /tmp/dojo-mini-json-query-3.almd:25:47
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
25 |       list.sum(list.map(kvs, (k, v) => jcount(v)))
   |                                               ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
