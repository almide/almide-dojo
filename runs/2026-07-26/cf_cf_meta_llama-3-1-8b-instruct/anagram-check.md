# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(list.filter(string.chars(string.to_lower(a)))) == 
  list.sort(list.filter(string.chars(string.to_lower(b))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-0.almd:2:54
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
2 |   list.sort(list.filter(string.chars(string.to_lower(a)))) ==
  |                                                      ^
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-0.almd:3:54
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
3 |   list.sort(list.filter(string.chars(string.to_lower(b))))
  |                                                      ^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(list.filter(string.chars(string.to_lower(a)), (c: String) => c != " ")) == 
  list.sort(list.filter(string.chars(string.to_lower(b)), (c: String) => c != " "))
```
