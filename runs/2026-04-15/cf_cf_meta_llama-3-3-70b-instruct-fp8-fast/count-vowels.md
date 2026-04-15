# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  let
    chars = string.chars(s)
    vowels = list.filter(chars, (x) => 
      x == "a" || x == "e" || x == "i" || x == "o" || x == "u"
    )
  in
  list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-count-vowels-0.almd:2:6
  |
2 |   let
  |      ^
error: '||' is not valid in Almide at line 5:16
  --> /tmp/dojo-count-vowels-0.almd:5:16
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
5 |       x == "a" || x == "e" || x == "i" || x == "o" || x == "u"
  |                ^
error[E003]: undefined variable 'vowels'
  --> /tmp/dojo-count-vowels-0.almd:8:12
  in variable vowels
  hint: Check the variable name
  |
8 |   list.len(vowels)
  |            ^^^^^^

3 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = list.filter(chars, (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
  in list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-count-vowels-1.almd:4:3
  |
4 |   in list.len(vowels)
  |   ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-1.almd:3:95
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let vowels = list.filter(chars, (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
  |                                                                                               ^^^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = list.filter(chars, (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
  list.len(vowels)
```
