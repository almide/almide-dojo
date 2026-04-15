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
    JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-0.almd:11:52
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
   |                                                    ^
error: Expected pattern at line 31:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:31:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:21:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:21:30
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-0.almd:21:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

8 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
  }

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-1.almd:11:52
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
   |                                                    ^
error: Expected LParen at line 32:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:32:15
   |
32 | effect fn main
   |               ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:21:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:21:30
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E010]: non-exhaustive match: missing JNull, JBool(_), JNum(_)
  --> /tmp/dojo-mini-json-query-1.almd:26:9
  in match
  hint: Add arms for JNull, JBool(_), JNum(_), or use '_'
   |
26 |   match val {
   |         ^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:21:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

9 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
  }

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-2.almd:11:52
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
   |                                                    ^
error: Expected LParen at line 32:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:32:15
   |
32 | effect fn main
   |               ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:21:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:30
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E010]: non-exhaustive match: missing JNull, JBool(_), JNum(_)
  --> /tmp/dojo-mini-json-query-2.almd:26:9
  in match
  hint: Add arms for JNull, JBool(_), JNum(_), or use '_'
   |
26 |   match val {
   |         ^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:21:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-2.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

9 error(s) found
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
    JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
  }

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-mini-json-query-3.almd:11:52
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key) >>= (x) => Some(x.1)
   |                                                    ^
error: Expected LParen at line 32:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:32:15
   |
32 | effect fn main
   |               ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:21:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:30
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E010]: non-exhaustive match: missing JNull, JBool(_), JNum(_)
  --> /tmp/dojo-mini-json-query-3.almd:26:9
  in match
  hint: Add arms for JNull, JBool(_), JNum(_), or use '_'
   |
26 |   match val {
   |         ^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:44
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^

9 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
