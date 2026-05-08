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
    JObj(xs) => {
      match xs.find({ (k, _) => k == key }) {
        some((_, v)) => some(v)
        none => none
      }
    }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 36:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:36:1
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:13
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs.find({ (k, _) => k == key }) {
   |             ^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:27:26
  in call to list.map()
  hint: Fix the argument type
   |
27 |     JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
   |                          ^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:13
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs.find({ (k, _) => k == key }) {
   |             ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:27:26
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
27 |     JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
   |                          ^^

5 error(s) found
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
    JObj(xs) => {
      match xs.find({ (k, _) => k == key }) {
        some((_, v)) => some(v)
        none => none
      }
    }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close parenthesized expression opened at line 34:37
  --> /tmp/dojo-mini-json-query-1.almd:34:39
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
34 |     JObj(xs) => list.flat_map(xs, { (k
   |                                     --------------- '(' opened here
   |
34 |     JObj(xs) => list.flat_map(xs, { (k
   |                                       ^
error: Expected expression at line 36:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:36:1
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 34:30
  --> /tmp/dojo-mini-json-query-1.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |     JObj(xs) => list.flat_map(xs, { (k
   |                              --------------- '(' opened here
...
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:13
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs.find({ (k, _) => k == key }) {
   |             ^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:27:26
  in call to list.map()
  hint: Fix the argument type
   |
27 |     JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
   |                          ^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:13
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs.find({ (k, _) => k == key }) {
   |             ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:27:26
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
27 |     JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
   |                          ^^

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
    JObj(xs) => {
      match xs.find({ (k, _) => k == key }) {
        some((_, v)) => some(v)
        none => none
      }
    }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close parenthesized expression opened at line 34:37
  --> /tmp/dojo-mini-json-query-2.almd:34:39
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
34 |     JObj(xs) => list.flat_map(xs, { (k
   |                                     --------------- '(' opened here
   |
34 |     JObj(xs) => list.flat_map(xs, { (k
   |                                       ^
error: Expected expression at line 36:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:36:1
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 34:30
  --> /tmp/dojo-mini-json-query-2.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |     JObj(xs) => list.flat_map(xs, { (k
   |                              --------------- '(' opened here
...
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:13
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs.find({ (k, _) => k == key }) {
   |             ^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:27:26
  in call to list.map()
  hint: Fix the argument type
   |
27 |     JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
   |                          ^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:13
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs.find({ (k, _) => k == key }) {
   |             ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:27:26
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
27 |     JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
   |                          ^^

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
    JObj(xs) => {
      match xs.find({ pair => pair.0 == key }) {
        some(pair) => some(pair.1)
        none => none
      }
    }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ pair => jcount(pair.1) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { pair => jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 12:28 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:12:28
   |
12 |       match xs.find({ pair => pair.0 == key }) {
   |                            ^
error: Expected expression at line 27:40 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:27:40
   |
27 |     JObj(xs) => list.sum(xs.map({ pair => jcount(pair.1) }))
   |                                        ^
error: Expected expression at line 34:42 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:34:42
   |
34 |     JObj(xs) => list.flat_map(xs, { pair => jflatten_strings
   |                                          ^
error: Expected expression at line 36:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:36:1
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error: Expected ')' to close function call opened at line 34:30
  --> /tmp/dojo-mini-json-query-3.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
34 |     JObj(xs) => list.flat_map(xs, { pair => jflatten_strings
   |                              --------------- '(' opened here
...
37 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   | ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-mini-json-query-3.almd:12:23
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
12 |       match xs.find({ pair => pair.0 == key }) {
   |                       ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:12:13
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs.find({ pair => pair.0 == key }) {
   |             ^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-mini-json-query-3.almd:27:35
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
27 |     JObj(xs) => list.sum(xs.map({ pair => jcount(pair.1) }))
   |                                   ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:27:26
  in call to list.map()
  hint: Fix the argument type
   |
27 |     JObj(xs) => list.sum(xs.map({ pair => jcount(pair.1) }))
   |                          ^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:12:13
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs.find({ pair => pair.0 == key }) {
   |             ^^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:27:26
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
27 |     JObj(xs) => list.sum(xs.map({ pair => jcount(pair.1) }))
   |                          ^^

11 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
