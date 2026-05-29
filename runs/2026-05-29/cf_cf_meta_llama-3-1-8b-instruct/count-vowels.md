# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  let vowels = list.from_list(["a", "e", "i", "o", "u"])
  list.count(string.chars(s), lambda(x: list.contains(vowels, x)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: 'lambda' is not valid in Almide at line 3:31
  --> /tmp/dojo-count-vowels-0.almd:3:31
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |   list.count(string.chars(s), lambda(x: list.contains(vowels, x)))
  |                               ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-count-vowels-0.almd:2:52
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let vowels = list.from_list(["a", "e", "i", "o", "u"])
  |                                                    ^^^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-0.almd:2:52
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let vowels = list.from_list(["a", "e", "i", "o", "u"])
  |                                                    ^^^

3 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  let vowels = list.from_list(["a", "e", "i", "o", "u"])
  list.count(string.chars(s), (x) => list.contains(vowels, x))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-count-vowels-1.almd:2:52
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let vowels = list.from_list(["a", "e", "i", "o", "u"])
  |                                                    ^^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  let vowels = list.from_list(["a", "e", "i", "o", "u"])
  list.filter(string.chars(s), (x) => list.contains(vowels, x)).len()
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-count-vowels-2.almd:2:52
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let vowels = list.from_list(["a", "e", "i", "o", "u"])
  |                                                    ^^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  let vowels = list.from_list(["a", "e", "i", "o", "u"])
  list.filter(string.chars(s), (x) => list.contains(vowels, x)).len()
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-count-vowels-3.almd:2:52
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let vowels = list.from_list(["a", "e", "i", "o", "u"])
  |                                                    ^^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
