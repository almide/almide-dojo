# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:26:25
  in call to jcount()
  hint: Check the function name
   |
26 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:30:20
  in call to jcount()
  hint: Check the function name
   |
30 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:34:25
  in call to jcount()
  hint: Check the function name
   |
34 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:38:49
  in call to jcount()
  hint: Check the function name
   |
38 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:44:16
  in call to jcount()
  hint: Check the function name
   |
44 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-0.almd:49:25
  in call to jcount()
  hint: Check the function name
   |
49 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:53:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
53 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:57:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
57 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:61:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
61 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:67:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
67 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:72:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
72 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

11 error(s) found
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
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:26:25
  in call to jcount()
  hint: Check the function name
   |
26 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:30:20
  in call to jcount()
  hint: Check the function name
   |
30 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:34:25
  in call to jcount()
  hint: Check the function name
   |
34 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:38:49
  in call to jcount()
  hint: Check the function name
   |
38 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:44:16
  in call to jcount()
  hint: Check the function name
   |
44 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:49:25
  in call to jcount()
  hint: Check the function name
   |
49 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:53:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
53 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:57:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
57 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:61:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
61 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:67:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
67 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:72:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
72 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

11 error(s) found
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
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:26:25
  in call to jcount()
  hint: Check the function name
   |
26 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:30:20
  in call to jcount()
  hint: Check the function name
   |
30 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:34:25
  in call to jcount()
  hint: Check the function name
   |
34 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:38:49
  in call to jcount()
  hint: Check the function name
   |
38 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:44:16
  in call to jcount()
  hint: Check the function name
   |
44 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-2.almd:49:25
  in call to jcount()
  hint: Check the function name
   |
49 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:53:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
53 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:57:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
57 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:61:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
61 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:67:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
67 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:72:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
72 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

11 error(s) found
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
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:26:25
  in call to jcount()
  hint: Check the function name
   |
26 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:30:20
  in call to jcount()
  hint: Check the function name
   |
30 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:34:25
  in call to jcount()
  hint: Check the function name
   |
34 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:38:49
  in call to jcount()
  hint: Check the function name
   |
38 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:44:16
  in call to jcount()
  hint: Check the function name
   |
44 |     ("b", JStr("x"))
   |                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-3.almd:49:25
  in call to jcount()
  hint: Check the function name
   |
49 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:53:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
53 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:57:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
57 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:61:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
61 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:67:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
67 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:72:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
72 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

11 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
