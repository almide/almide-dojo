# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower()).toList();
    let mut count = map.new();
    list.fold(words, count, |acc, x| {
        map.set(acc, x, map.get_or(acc, x, 0) + 1);
        acc
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
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower()).toList();
    let mut count = map.new();
    list.fold(words, count, |acc, x| {
        map.set(acc, x, map.get_or(acc, x, 0) + 1);
        acc
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
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower()).toList();
  |                                             ^
error: 'let mut' is not valid in Almide at line 3:9
  --> /tmp/dojo-word-count-1.almd:3:9
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |     let mut count = map.new();
  |         ^
error: '|x|' closure syntax is not valid in Almide at line 4:29
  --> /tmp/dojo-word-count-1.almd:4:29
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |     list.fold(words, count, |acc, x| {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:7:6
  |
7 |     })
  |      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:5:17
  in variable acc
  hint: Check the variable name
  |
5 |         map.set(acc, x, map.get_or(acc, x, 0) + 1);
  |                 ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-word-count-1.almd:5:22
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
5 |         map.set(acc, x, map.get_or(acc, x, 0) + 1);
  |                      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:5:36
  in variable acc
  hint: Check the variable name
  |
5 |         map.set(acc, x, map.get_or(acc, x, 0) + 1);
  |                                    ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-word-count-1.almd:5:41
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
5 |         map.set(acc, x, map.get_or(acc, x, 0) + 1);
  |                                         ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:6:9
  in variable acc
  hint: Check the variable name
  |
6 |         acc
  |         ^^^

9 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower()).toList();
    var count = map.new();
    list.fold(words, count, (acc, x) => {
        map.set(acc, x, map.get_or(acc, x, 0) + 1);
        acc
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-2.almd:2:45
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower()).toList();
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, count, (acc, x) => {
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
    let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x.to_lower()).toList();
    let count = map.new();
    list.fold(words, count, (acc, x) => {
        map.set(acc, x, map.get_or(acc, x, 0) + 1);
        acc
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: '!' is not valid in Almide at line 2:52
  --> /tmp/dojo-word-count-3.almd:2:52
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |     let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x.to_lower()).toList();
  |                                                    ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, count, (acc, x) => {
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
