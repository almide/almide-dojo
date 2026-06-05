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
      let pair = list.find(pairs, (x) => string.equals(x._1, key))
      in
        match pair {
          some((_, val)) => some(val)
          none => none
        }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) =>
      list.sum(list.map(xs, (x) => jcount(x)), 0)
    JObj(pairs) =>
      list.sum(list.map(pairs, (x) => jcount(x._2)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-mini-json-query-0.almd:12:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |       let pair = list.find(pairs, (x) => string.equals(x._1, key))
   |       ^^^
error: Expected FatArrow at line 23:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:23:11
   |
23 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 36:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:36:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
36 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

3 error(s) found
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
      match list.find(pairs, (x) => string.equals(x._1, key)) {
        some((_, val)) => some(val)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) =>
      list.sum(list.map(xs, (x) => jcount(x)), 0)
    JObj(pairs) =>
      list.sum(list.map(pairs, (x) => jcount(x._2)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-1.almd:12:57
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       match list.find(pairs, (x) => string.equals(x._1, key)) {
   |                                                         ^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:26:48
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
26 |       list.sum(list.map(xs, (x) => jcount(x)), 0)
   |                                                ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:28:54
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
28 |       list.sum(list.map(pairs, (x) => jcount(x._2)), 0)
   |                                                      ^

4 error(s) found
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
      match list.find(pairs, (x) => string.equals(x._1, key)) {
        some((_, val)) => some(val)
        none => none
      }
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
      list.sum(list.map(pairs, (x) => jcount(x._2)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map(xs, (x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close function call opened at line 35:20
  --> /tmp/dojo-mini-json-query-2.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |       list.flat_map(xs, (x)
   |                    --------------- '(' opened here
...
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-2.almd:12:57
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       match list.find(pairs, (x) => string.equals(x._1, key)) {
   |                                                         ^^^

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
      match list.find(pairs, (x) => string.equals(x._1, key)) {
        some((_, val)) => some(val)
        none => none
      }
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
      list.sum(list.map(pairs, (x) => jcount(x._2)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) =>
      list.flat_map(xs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 35:20
  --> /tmp/dojo-mini-json-query-3.almd:37:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
35 |       list.flat_map(xs
   |                    --------------- '(' opened here
...
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-3.almd:12:57
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       match list.find(pairs, (x) => string.equals(x._1, key)) {
   |                                                         ^^^

2 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
