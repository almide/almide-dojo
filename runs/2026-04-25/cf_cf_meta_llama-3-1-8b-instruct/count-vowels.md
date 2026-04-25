# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error[E005]: argument 'o' expects Option[A] but got List[String]
  --> /tmp/dojo-count-vowels-0.almd:1:136
  in call to option.filter()
  hint: Fix the argument type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^
error[E001]: type mismatch in call to option.filter(): expected Option[String] but got List[String]
  --> /tmp/dojo-count-vowels-0.almd:1:136
  in call to option.filter()
  hint: Fix the expression type or change the expected type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error[E005]: argument 'o' expects Option[A] but got List[String]
  --> /tmp/dojo-count-vowels-1.almd:1:136
  in call to option.filter()
  hint: Fix the argument type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^
error[E001]: type mismatch in call to option.filter(): expected Option[String] but got List[String]
  --> /tmp/dojo-count-vowels-1.almd:1:136
  in call to option.filter()
  hint: Fix the expression type or change the expected type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error[E005]: argument 'o' expects Option[A] but got List[String]
  --> /tmp/dojo-count-vowels-2.almd:1:136
  in call to option.filter()
  hint: Fix the argument type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^
error[E001]: type mismatch in call to option.filter(): expected Option[String] but got List[String]
  --> /tmp/dojo-count-vowels-2.almd:1:136
  in call to option.filter()
  hint: Fix the expression type or change the expected type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error[E005]: argument 'o' expects Option[A] but got List[String]
  --> /tmp/dojo-count-vowels-3.almd:1:136
  in call to option.filter()
  hint: Fix the argument type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^
error[E001]: type mismatch in call to option.filter(): expected Option[String] but got List[String]
  --> /tmp/dojo-count-vowels-3.almd:1:136
  in call to option.filter()
  hint: Fix the expression type or change the expected type
  |
1 | fn count_vowels(s: String) -> Int = list.count(string.chars(s), (c) => option.is_some(option.filter(string.chars("aeiou"), (x) => x == c)))
  |                                                                                                                                        ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
