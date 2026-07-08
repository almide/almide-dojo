# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?1]
  --> /tmp/dojo-word-count-0.almd:4:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^

5 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:4:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:4:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?1]
  --> /tmp/dojo-word-count-1.almd:4:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^

5 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))

// corrected version
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))

// corrected version
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))

// corrected version
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get(word,
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:8:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
8 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:14:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
14 |   let words = string.split(s, " ").filter(x => x != "")
   |                                             ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:20:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
20 |   let words = string.split(s, " ").filter(x => x != "")
   |                                             ^^
error: Expected expression at line 24:1 (got Test 'test')
  --> /tmp/dojo-word-count-2.almd:24:1
   |
24 | test "word_count empty" { assert_eq(word_count(""), [:]) }
   | ^
error[E012]: duplicate function 'word_count'
  at line 7
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn word_count(s: String) -> Map[String, Int] =
  | ------------------------------------- first definition of 'word_count' here
...
7 | fn word_count(s: String) -> Map[String, Int] =
  | ^^^^^^^^^^^^^
error[E012]: duplicate function 'word_count'
  at line 13
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn word_count(s: String) -> Map[String, Int] =
   | ------------------------------------- first definition of 'word_count' here
...
13 | fn word_count(s: String) -> Map[String, Int] =
   | ^^^^^^^^^^^^^
error[E012]: duplicate function 'word_count'
  at line 19
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn word_count(s: String) -> Map[String, Int] =
   | ------------------------------------- first definition of 'word_count' here
...
19 | fn word_count(s: String) -> Map[String, Int] =
   | ^^^^^^^^^^^^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:4:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:4:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:9:13
  in variable words
  hint: Check the variable name
  |
9 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:10:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
   |
10 |     map.set(word, map.get_or(word, 0) + 1))
   |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:10:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
   |
10 |     map.set(word, map.get_or(word, 0) + 1))
   |                                         ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:15:13
  in variable words
  hint: Check the variable name
   |
15 |   list.fold(words, map.new(), (map, word) =>
   |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:16:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
   |
16 |     map.set(word, map.get_or(word, 0) + 1))
   |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:16:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
   |
16 |     map.set(word, map.get_or(word, 0) + 1))
   |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?1]
  --> /tmp/dojo-word-count-2.almd:4:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?7]
  --> /tmp/dojo-word-count-2.almd:10:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
   |
10 |     map.set(word, map.get_or(word, 0) + 1))
   |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?13]
  --> /tmp/dojo-word-count-2.almd:16:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
   |
16 |     map.set(word, map.get_or(word, 0) + 1))
   |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:20:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
   |
20 |   let words = string.split(s, " ").filter(x => x != "")
   |   ^^^

21 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-3.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:4:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:4:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?1]
  --> /tmp/dojo-word-count-3.almd:4:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
