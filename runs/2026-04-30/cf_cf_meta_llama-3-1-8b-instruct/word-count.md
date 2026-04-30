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
  let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  let init = map.new();
  let count = list.fold(words, init, |acc, word| {
    let count = map.get_or(acc, word, 0);
    map.set(acc, word, count + 1);
    acc
  });
  count
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
  let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  let init = map.new();
  let count = list.fold(words, init, |acc, word| {
    let count = map.get_or(acc, word, 0);
    map.set(acc, word, count + 1);
    acc
  });
  count
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-1.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  |                                           ^
error: '|x|' closure syntax is not valid in Almide at line 4:38
  --> /tmp/dojo-word-count-1.almd:4:38
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |   let count = list.fold(words, init, |acc, word| {
  |                                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:8:4
  |
8 |   });
  |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:5:28
  in variable acc
  hint: Check the variable name
  |
5 |     let count = map.get_or(acc, word, 0);
  |                            ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:33
  in variable word
  hint: Check the variable name
  |
5 |     let count = map.get_or(acc, word, 0);
  |                                 ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:6:13
  in variable acc
  hint: Check the variable name
  |
6 |     map.set(acc, word, count + 1);
  |             ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:18
  in variable word
  hint: Check the variable name
  |
6 |     map.set(acc, word, count + 1);
  |                  ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:7:5
  in variable acc
  hint: Check the variable name
  |
7 |     acc
  |     ^^^

8 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => !x.is_empty()).to_list();
  let init = map.new();
  let count = list.fold(words, init, (acc, word) => {
    let count = map.get_or(acc, word, 0);
    map.set(acc, word, count + 1);
    acc
  });
  count
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '!' is not valid in Almide at line 2:50
  --> /tmp/dojo-word-count-2.almd:2:50
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   let words = string.split(s, " ").filter((x) => !x.is_empty()).to_list();
  |                                                  ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:25
  in variable words
  hint: Check the variable name
  |
4 |   let count = list.fold(words, init, (acc, word) => {
  |                         ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => not x.is_empty()).to_list();
  let init = map.new();
  let count = list.fold(words, init, (acc, word) => {
    let count = map.get_or(acc, word, 0);
    map.set(acc, word, count + 1);
    acc
  });
  count
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?1) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:31
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let words = string.split(s, " ").filter((x) => not x.is_empty()).to_list();
  |                               ^^^
error[E002]: undefined method 'to_list' on list
  --> /tmp/dojo-word-count-3.almd:2:31
  in method call .to_list()
  hint: Almide doesn't use method-call syntax. Write `list.<fn>(x)` (or `x |> list.<fn>`) — there is no method `to_list` on `list`. Run `almide explain E002` for examples.
  |
2 |   let words = string.split(s, " ").filter((x) => not x.is_empty()).to_list();
  |                               ^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> ?1) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:31
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ").filter((x) => not x.is_empty()).to_list();
  |                               ^^^

3 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
