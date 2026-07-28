# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JNull => none
  JBool(_) => none
  JNum(_) => none
  JStr(_) => none
  JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false })
  JObj(pairs) => list.find(pairs, (pair) => match pair { (k, v) => if k == key then v else none }) |> option.unwrap_or(JNull)
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JNull => []
  JBool(_) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 6:99 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-0.almd:6:99
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |   JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false })
  |                                                                                                   ^
error: Expected pattern at line 16:79 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-0.almd:16:79
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |   JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
   |                                                                               ^
error: Expected expression at line 23:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:23:1
   |
23 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:31:68
  in list element
  hint: Fix the expression type or change the expected type
   |
31 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:31:89
  in list element
  hint: Fix the expression type or change the expected type
   |
31 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:35:86
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:36:116
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:36:116
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JNull => none
  JBool(_) => none
  JNum(_) => none
  JStr(_) => none
  JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false; none => false })
  JObj(pairs) => list.find(pairs, (pair) => match pair { (k, v) => if k == key then some(v) else none })
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JNull => []
  JBool(_) => []
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 6:99 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-1.almd:6:99
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |   JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false; none => false })
  |                                                                                                   ^
error: Expected pattern at line 16:79 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-1.almd:16:79
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |   JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
   |                                                                               ^
error: Expected pattern at line 23:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:23:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
23 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:31:68
  in list element
  hint: Fix the expression type or change the expected type
   |
31 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:31:89
  in list element
  hint: Fix the expression type or change the expected type
   |
31 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:35:86
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:36:116
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:36:116
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JNull => none
  JBool(_) => none
  JNum(_) => none
  JStr(_) => none
  JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false })
  JObj(pairs) => list.find(pairs, (pair) => match pair { (k, v) => if k == key then some(v) else none })
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JNull => []
  JBool(_) => []
  JNum(_)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 6:99 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-2.almd:6:99
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |   JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false })
  |                                                                                                   ^
error: Expected pattern at line 16:79 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-2.almd:16:79
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
16 |   JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
   |                                                                               ^
error: Expected FatArrow at line 22:10 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:22:10
   |
22 |   JNum(_)
   |          ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:32:68
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:32:89
  in list element
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:36:86
  in list element
  hint: Fix the expression type or change the expected type
   |
36 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:37:116
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn main() -> Unit = {}

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JNull => none
  JBool(_) => none
  JNum(_) => none
  JStr(_) => none
  JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false })
  JObj(pairs) => list.find(pairs, (pair) => match pair { (k, v) => if k == key then some(v) else none })
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs.map((x) => jcount(x)))
  JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JNull => []
  J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 8:99 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-3.almd:8:99
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |   JArr(xs) => list.flat_map(xs, (x) => jget(x, key)) |> list.find((x) => match x { JObj(_) => true; _ => false })
  |                                                                                                   ^
error: Expected pattern at line 18:79 (got Semicolon ';')
  --> /tmp/dojo-mini-json-query-3.almd:18:79
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |   JObj(pairs) => list.sum(pairs.map((pair) => match pair { (k, v) => jcount(v); _ => 0 }))
   |                                                                               ^
error: Expected FatArrow at line 23:4 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:23:4
   |
23 |   J
   |    ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:33:68
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:33:89
  in list element
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:37:86
  in list element
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:38:116
  in list element
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
