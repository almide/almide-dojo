# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
    let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    list.fold(words, map.new[String, Int](), (acc, x) => 
        match map.get(acc, x) {
            some(count) => map.set(acc, x, count + 1)
            none => map.set(acc, x, 1)
        })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:53
  |
2 |     let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                     ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:15
  in variable words
  hint: Check the variable name
  |
3 |     list.fold(words, map.new[String, Int](), (acc, x) =>
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
    let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    list.fold(words, map.new[String, Int](), (acc, x) => 
        match map.get(acc, x) {
            some(count) => map.set(acc, x, count + 1)
            none => map.set(acc, x, 1)
        })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:53
  |
2 |     let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                     ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:15
  in variable words
  hint: Check the variable name
  |
3 |     list.fold(words, map.new[String, Int](), (acc, x) =>
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
    let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    let count_map = map.new[String, Int]()
    list.fold(words, count_map, (acc, x) => 
        match map.get(acc, x) {
            some(count) => map.set(acc, x, count + 1)
            none => map.set(acc, x, 1)
        })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:53
  |
2 |     let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                     ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, count_map, (acc, x) =>
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
    let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    let count_map = map.new[String, Int]()
    list.fold(words, count_map, (acc, x) => 
        match map.get(acc, x) {
            some(count) => map.set(acc, x, count + 1)
            none => map.set(acc, x, 1)
        })

fn word_count_test(s: String) -> Map[String, Int] = word_count(s)

fn test_word_count() -> Unit = 
    let test_cases = [
        ("the cat and the dog", map.new[String, Int]({"the": 2, "cat": 1, "and": 1, "dog": 1})),
        ("", map.new[String, Int]()),
        ("hello world", map.new[String, Int]({"hello": 1, "world": 1}))
    ]
    for (input, expected) in test_cases {
        let actual = word_count(input)
        assert(map.equals(actual, expected))
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:53 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:53
  |
2 |     let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                     ^
error: Expected expression at line 14:60 (got Colon ':')
  --> /tmp/dojo-word-count-3.almd:14:60
   |
14 |         ("the cat and the dog", map.new[String, Int]({"the": 2, "cat": 1, "and": 1, "dog": 1})),
   |                                                            ^
error: Expected expression at line 16:54 (got Colon ':')
  --> /tmp/dojo-word-count-3.almd:16:54
   |
16 |         ("hello world", map.new[String, Int]({"hello": 1, "world": 1}))
   |                                                      ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, count_map, (acc, x) =>
  |               ^^^^^
error[E004]: map.new() expects 0 argument(s) but got 1
  --> /tmp/dojo-word-count-3.almd:14:55
  in call to map.new()
  hint: Check the number of arguments
  try:
      // map.new() takes 0 arg(s) — you passed 1
      map.new()
   |
14 |         ("the cat and the dog", map.new[String, Int]({"the": 2, "cat": 1, "and": 1, "dog": 1})),
   |                                                       ^^^^^
error[E004]: map.new() expects 0 argument(s) but got 1
  --> /tmp/dojo-word-count-3.almd:16:47
  in call to map.new()
  hint: Check the number of arguments
  try:
      // map.new() takes 0 arg(s) — you passed 1
      map.new()
   |
16 |         ("hello world", map.new[String, Int]({"hello": 1, "world": 1}))
   |                                               ^^^^^^^
error[E002]: undefined function 'map.equals'
  --> /tmp/dojo-word-count-3.almd:20:35
  in call to map.equals()
  hint: No function 'equals' in module 'map'. See docs/CHEATSHEET.md for available functions
   |
20 |         assert(map.equals(actual, expected))
   |                                   ^^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
