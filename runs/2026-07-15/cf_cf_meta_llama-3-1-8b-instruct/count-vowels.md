# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(list.map(string.chars(s), (c) => list.contains(["a", "e", "i", "o", "u"], c))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-count-vowels-0.almd:2:98
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
2 |   list.len(list.filter(list.map(string.chars(s), (c) => list.contains(["a", "e", "i", "o", "u"], c))))
  |                                                                                                  ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => list.contains(["a", "e", "i", "o", "u"], c)))
```
