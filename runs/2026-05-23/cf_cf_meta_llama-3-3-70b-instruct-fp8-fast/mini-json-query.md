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
      list.find(pairs, (x) => string.equals(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(pairs) => pairs |> list.sum((x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map(jflatten_strings)
    JObj(pairs) => pairs
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
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-0.almd:12:50
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key))
   |                                                  ^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:24:52
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(pairs) => pairs |> list.sum((x) => jcount(x.1))
   |                                                    ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:24:52
  in call to list.sum()
  hint: Fix the argument type
   |
24 |     JObj(pairs) => pairs |> list.sum((x) => jcount(x.1))
   |                                                    ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:24:52
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
24 |     JObj(pairs) => pairs |> list.sum((x) => jcount(x.1))
   |                                                    ^

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
    JObj(pairs) => 
      list.find(pairs, (x) => string.equals(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(pairs) => list.sum(pairs |> list.map((x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map(jflatten_strings)
    JObj(pairs) => pairs |>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-1.almd:12:50
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key))
   |                                                  ^^^

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
    JObj(pairs) => 
      list.find(pairs, (x) => string.equals(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(pairs) => list.sum(pairs |> list.map((x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map(jflatten_strings)
    JObj(pairs) => pairs |>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-2.almd:12:50
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key))
   |                                                  ^^^

2 error(s) found
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
      list.find(pairs, (x) => string.equals(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(pairs) => list.sum(pairs |> list.map((x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map(jflatten_strings)
    JObj(pairs) => pairs |>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-3.almd:12:50
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key))
   |                                                  ^^^

2 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
