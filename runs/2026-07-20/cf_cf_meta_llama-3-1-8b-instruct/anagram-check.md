# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a)
  let b = string.to_lower(b)
  let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  list.sort(a) == list.sort(b)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected expression at line 4:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:4:40
  |
4 |   let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:5:40
  |
5 |   let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:6:13
  in call to list.sort()
  hint: Fix the argument type
  |
6 |   list.sort(a) == list.sort(b)
  |             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:6:29
  in call to list.sort()
  hint: Fix the argument type
  |
6 |   list.sort(a) == list.sort(b)
  |                             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:6:13
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
6 |   list.sort(a) == list.sort(b)
  |             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:6:29
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
6 |   list.sort(a) == list.sort(b)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a)
  let b = string.to_lower(b)
  let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  list.sort(list.map(a, fn(x) => x)) == list.sort(list.map(b, fn(x) => x))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 4:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:4:40
  |
4 |   let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:5:40
  |
5 |   let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 6:25 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:6:25
  |
6 |   list.sort(list.map(a, fn(x) => x)) == list.sort(list.map(b, fn(x) => x))
  |                         ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-1.almd:3:27
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |   let b = string.to_lower(b)
  |                           ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a)
  let b = string.to_lower(b)
  let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  list.sort(list.map(a, fn(x) => x)) == list.sort(list.map(b, fn(x) => x))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 4:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:4:40
  |
4 |   let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:5:40
  |
5 |   let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 6:25 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:6:25
  |
6 |   list.sort(list.map(a, fn(x) => x)) == list.sort(list.map(b, fn(x) => x))
  |                         ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-2.almd:3:27
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |   let b = string.to_lower(b)
  |                           ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a)
  let b = string.to_lower(b)
  let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  list.sort(list.map(a, fn(x) => x)) == list.sort(list.map(b, fn(x) => x))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 4:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:4:40
  |
4 |   let a = list.filter(string.chars(a), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:5:40
  |
5 |   let b = list.filter(string.chars(b), fn(x) => not(string.is_whitespace(x)))
  |                                        ^
error: Expected expression at line 6:25 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:6:25
  |
6 |   list.sort(list.map(a, fn(x) => x)) == list.sort(list.map(b, fn(x) => x))
  |                         ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-3.almd:3:27
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |   let b = string.to_lower(b)
  |                           ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
