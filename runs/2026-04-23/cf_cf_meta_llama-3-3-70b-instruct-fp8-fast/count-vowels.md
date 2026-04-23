# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
    let chars = string.chars(s)
    let vowels = list.filter(chars, (x) => 
        x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
    in list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: '||' is not valid in Almide at line 4:18
  --> /tmp/dojo-count-vowels-0.almd:4:18
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |         x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                  ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-0.almd:2:30
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |     let chars = string.chars(s)
  |                              ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
    let chars = string.chars(s)
    let vowels = list.filter(chars, (x) => 
        x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
    in list.len(vowels)
```
