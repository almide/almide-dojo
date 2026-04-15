# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

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
    JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x._2))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected ')' to close function call opened at line 11:54
  --> /tmp/dojo-mini-json-query-0.almd:11:56
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |     JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
   |                                                      --------------- '(' opened here
   |
11 |     JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
   |                                                        ^
error: Expected ')' to close function call opened at line 11:54 at line 11:56
  --> /tmp/dojo-mini-json-query-0.almd:11:54
   |
11 |     JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
   |                                                      ^
error: Expected ')' to close function call opened at line 29:30
  --> /tmp/dojo-mini-json-query-0.almd:31:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(xs) => list.flat_map(xs, (x) => jflatten_strings
   |                              --------------- '(' opened here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error: Expected ')' to close function call opened at line 29:30 at line 31:1
  --> /tmp/dojo-mini-json-query-0.almd:29:30
   |
29 |     JObj(xs) => list.flat_map(xs, (x) => jflatten_strings
   |                              ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:31:76
  in call to jget()
  hint: Check the function name
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:32:64
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:33:47
  in call to jget()
  hint: Check the function name
   |
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-0.almd:34:50
  in call to jget()
  hint: Check the function name
   |
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:43:95
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:44:116
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:45:65
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^

19 error(s) found
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
    JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x._2))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x._2))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 11:54
  --> /tmp/dojo-mini-json-query-1.almd:11:56
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |     JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
   |                                                      --------------- '(' opened here
   |
11 |     JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
   |                                                        ^
error: Expected ')' to close function call opened at line 11:54 at line 11:56
  --> /tmp/dojo-mini-json-query-1.almd:11:54
   |
11 |     JObj(xs) => list.find(xs, (k, v) => k == key).map(_._2)
   |                                                      ^
error: Expected pattern at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:31:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:31:76
  in call to jget()
  hint: Check the function name
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:32:64
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:33:47
  in call to jget()
  hint: Check the function name
   |
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:34:50
  in call to jget()
  hint: Check the function name
   |
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:43:95
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:44:116
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:45:65
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^

18 error(s) found
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
    JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x._2))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x._2))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close function call opened at line 11:56
  --> /tmp/dojo-mini-json-query-2.almd:11:58
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |     JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
   |                                                        --------------- '(' opened here
   |
11 |     JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
   |                                                          ^
error: Expected ')' to close function call opened at line 11:56 at line 11:58
  --> /tmp/dojo-mini-json-query-2.almd:11:56
   |
11 |     JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
   |                                                        ^
error: Expected pattern at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:31:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:31:76
  in call to jget()
  hint: Check the function name
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:32:64
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:33:47
  in call to jget()
  hint: Check the function name
   |
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-2.almd:34:50
  in call to jget()
  hint: Check the function name
   |
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:43:95
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:44:116
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:45:65
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^

18 error(s) found
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
    JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x._2))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x._2))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 11:56
  --> /tmp/dojo-mini-json-query-3.almd:11:58
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |     JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
   |                                                        --------------- '(' opened here
   |
11 |     JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
   |                                                          ^
error: Expected ')' to close function call opened at line 11:56 at line 11:58
  --> /tmp/dojo-mini-json-query-3.almd:11:56
   |
11 |     JObj(xs) => option.find(xs, (k, v) => k == key).map(_._2)
   |                                                        ^
error: Expected pattern at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:31:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:21:44
  in call to list.sum()
  hint: Check the number of arguments
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:44
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:31:76
  in call to jget()
  hint: Check the function name
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:32:64
  in call to jget()
  hint: Check the function name
   |
32 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:33:47
  in call to jget()
  hint: Check the function name
   |
33 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:34:50
  in call to jget()
  hint: Check the function name
   |
34 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:41:68
  in call to jflatten_strings()
  hint: Check the function name
   |
41 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:43:95
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:44:116
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:45:65
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x._2))
   |                                            ^

18 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
