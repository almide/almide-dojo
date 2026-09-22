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
      list.find(pairs, (x) => string.eq(x.0, key)) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1
```

**Diagnostic:**

```
error: Expected ')' to close function call opened at line 27:64
  --> /tmp/dojo-mini-json-query-0.almd:29:1
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: Add ')' or check for a missing delimiter inside the function call
   |
27 |     JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1
   |                                                                --------------- '(' opened here
...
29 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error: Expected ')' to close function call opened at line 27:64 at line 29:1
  --> /tmp/dojo-mini-json-query-0.almd:27:64
  here: JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 |     JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1
   |                                                                ^
error[E002]: undefined function 'string.eq'
  --> /tmp/dojo-mini-json-query-0.almd:12:46
  in call to string.eq()
  here: list.find(pairs, (x) => string.eq(x.0, key)) |> option.map((x) => x.1)
  hint: Did you mean `a == b (operator)`?
  try:
      // Almide uses operators, not comparison functions:
      //   int.gt(a, b)   →  a > b
      //   int.lt(a, b)   →  a < b
      //   int.gte(a, b)  →  a >= b
      //   int.lte(a, b)  →  a <= b
      //   int.eq(a, b)   →  a == b
      //   int.neq(a, b)  →  a != b
      // (same for float, string, bool — == and != work on any type)
   |
12 |       list.find(pairs, (x) => string.eq(x.0, key)) |> option.map((x) => x.1)
   |                                              ^^^

3 error(s) found
FAILED: /tmp/dojo-mini-json-query-0.almd
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
```

**Diagnostic:**

```
error: Expected pattern at line 30:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:30:1
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-1.almd
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
```

**Diagnostic:**

```
error: Expected pattern at line 30:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:30:1
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-2.almd
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
```

**Diagnostic:**

```
error: Expected pattern at line 30:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:30:1
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-3.almd
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
