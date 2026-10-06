# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  let chars = string.chars(s)
  let vowels = list.filter(chars, (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  in list.len(vowels)
```

**Diagnostic:**

```
error: '||' is not valid in Almide at line 3:51
  --> /tmp/dojo-count-vowels-0.almd:3:51
  here: let vowels = list.filter(chars, (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
3 |   let vowels = list.filter(chars, (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                                   ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-0.almd:2:28
  in fn 'count_vowels'
  here: let chars = string.chars(s)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let chars = string.chars(s)
  |                            ^

2 error(s) found
FAILED: /tmp/dojo-count-vowels-0.almd
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  let chars = string.chars(s)
  let vowels = list.filter(chars, (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
  in list.len(vowels)
```
