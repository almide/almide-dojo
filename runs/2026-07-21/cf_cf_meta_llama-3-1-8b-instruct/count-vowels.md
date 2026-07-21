# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int {
    list.count(string.chars(s), fn (c: String) => list.contains(["a", "e", "i", "o", "u"], c))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-count-vowels-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn count_vowels(...) -> Type = { ... }
  |
1 | fn count_vowels(s: String) -> Int {
  |                                   ^
error: Expected function name at line 2:36 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:36
  |
2 |     list.count(string.chars(s), fn (c: String) => list.contains(["a", "e", "i", "o", "u"], c))
  |                                    ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
    list.count(string.chars(s), fn (c: String) => list.contains(["a", "e", "i", "o", "u"], c))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 2:33 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:2:33
  |
2 |     list.count(string.chars(s), fn (c: String) => list.contains(["a", "e", "i", "o", "u"], c))
  |                                 ^
error: Expected function name at line 2:36 (got LParen '(')
  --> /tmp/dojo-count-vowels-1.almd:2:36
  |
2 |     list.count(string.chars(s), fn (c: String) => list.contains(["a", "e", "i", "o", "u"], c))
  |                                    ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
    list.count(string.chars(s), (c: String) => list.contains(["a", "e", "i", "o", "u"], c))
```
