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
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
      list.default(none),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, jcount)
    | JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 30:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:30:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:36
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
   |                                    ^^^
error[E005]: argument 'xs' expects List[A] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:12:68
  in call to list.map()
  hint: Fix the argument type
   |
12 |       list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
   |                                                                    ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(?2, ?3) -> Option[?3]
  --> /tmp/dojo-mini-json-query-0.almd:12:68
  in call to list.map()
  hint: Fix the argument type
   |
12 |       list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
   |                                                                    ^
error[E002]: undefined function 'list.default'
  --> /tmp/dojo-mini-json-query-0.almd:13:20
  in call to list.default()
  hint: No function 'default' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
13 |       list.default(none),
   |                    ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:36
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
   |                                    ^^^
error[E001]: type mismatch in call to list.map(): expected List[A] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:12:68
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
   |                                                                    ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(?2, ?3) -> Option[?3]
  --> /tmp/dojo-mini-json-query-0.almd:12:68
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(xs, (k, v) => k == key) |> list.map((_, v) => some(v)) |>
   |                                                                    ^

9 error(s) found
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
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) |>
      option.unwrap_or(none),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, jcount)
    | JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k, v) => jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 30:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:30:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:36
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(xs, (k, v) => k == key) |>
   |                                    ^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-1.almd:12:36
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(xs, (k, v) => k == key) |>
   |                                    ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected (String, JVal) but got Option[?2]
  --> /tmp/dojo-mini-json-query-1.almd:13:24
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
13 |       option.unwrap_or(none),
   |                        ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?3]
  --> /tmp/dojo-mini-json-query-1.almd:14:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
14 |     _ => none
   |          ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-1.almd:14:10
  in fn 'jget'
  hint: Fix the expression type or change the expected type
   |
14 |     _ => none
   |          ^^^^

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
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) |>
      option.map(option.unwrap_or(none)),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, jcount)
    | JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k, v) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 30:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:30:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:36
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(xs, (k, v) => k == key) |>
   |                                    ^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-2.almd:13:35
  in call to option.unwrap_or()
  hint: Check the number of arguments
   |
13 |       option.map(option.unwrap_or(none)),
   |                                   ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:36
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(xs, (k, v) => k == key) |>
   |                                    ^^^

5 error(s) found
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
    JObj(xs) =>
      list.find(xs, (k, v) => k == key) |>
      option.map(option.unwrap_or(none)),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    | JBool(_) => 1
    | JNum(_) => 1
    | JStr(_) => 1
    | JArr(xs) => list.sum(xs, jcount)
    | JObj(xs) => list.sum(xs, (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k, v) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 20:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:20:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     | JBool(_) => 1
   |     ^
error: Expected pattern at line 30:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:30:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 |     | JArr(xs) => list.flat_map(xs, jflatten_strings)
   |     ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:36
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(xs, (k, v) => k == key) |>
   |                                    ^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-3.almd:13:35
  in call to option.unwrap_or()
  hint: Check the number of arguments
   |
13 |       option.map(option.unwrap_or(none)),
   |                                   ^^^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:36
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(xs, (k, v) => k == key) |>
   |                                    ^^^

5 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
