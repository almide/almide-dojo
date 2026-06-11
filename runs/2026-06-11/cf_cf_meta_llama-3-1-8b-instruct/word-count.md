# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x)
    let init = map.new[String, Int]()
    list.fold(words, init, |acc, x| {
        let new = map.get_or(acc, x, 0)
        map.set(acc, x, new + 1)
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Missing '=' before function body at line 1:46
  --> /tmp/dojo-word-count-0.almd:1:46
  hint: Almide requires '=' before the body. Write: fn word_count(...) -> Type = { ... }
  |
1 | fn word_count(s: String) -> Map[String, Int] {
  |                                              ^

1 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x)
    let init = map.new[String, Int]()
    list.fold(words, init, |acc, x| {
        let new = map.get_or(acc, x, 0)
        map.set(acc, x, new + 1)
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-1.almd:2:45
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x)
  |                                             ^
error: '|x|' closure syntax is not valid in Almide at line 4:28
  --> /tmp/dojo-word-count-1.almd:4:28
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |     list.fold(words, init, |acc, x| {
  |                            ^
error: 'new' is not needed in Almide at line 6:25
  --> /tmp/dojo-word-count-1.almd:6:25
  hint: Construct records directly: Type { field: value }. Example: User { name: "Taro", age: 25 }
  |
6 |         map.set(acc, x, new + 1)
  |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:7:6
  |
7 |     })
  |      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:5:30
  in variable acc
  hint: Check the variable name
  |
5 |         let new = map.get_or(acc, x, 0)
  |                              ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-word-count-1.almd:5:35
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
5 |         let new = map.get_or(acc, x, 0)
  |                                   ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:5:38
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |         let new = map.get_or(acc, x, 0)
  |                                      ^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x)
    let init = map.new[String, Int]()
    list.fold(words, init, (acc, x) => {
        let new_count = map.get_or(acc, x, 0)
        map.set(acc, x, new_count + 1)
        acc
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '!' is not valid in Almide at line 2:52
  --> /tmp/dojo-word-count-2.almd:2:52
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |     let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x)
  |                                                    ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, init, (acc, x) => {
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x)
    let init = map.new[String, Int]()
    list.fold(words, init, (acc, x) => {
        let new_count = map.get_or(acc, x, 0)
        map.set(acc, x, new_count + 1)
        acc
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?2) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.filter()
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x)
  |                                 ^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> ?2) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x)
  |                                 ^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
