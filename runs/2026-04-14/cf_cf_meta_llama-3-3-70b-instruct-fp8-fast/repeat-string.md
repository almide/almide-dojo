# repeat-string

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Attempts

### Attempt 1 (FAIL)

```almide
def repeat(s: String, n: Int): String = {
  if (n == 0) "" 
  else if (n == 1) s 
  else s + repeat(s, n - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-repeat-string-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def repeat(s: String, n: Int): String = {
  | ^
error[E002]: undefined function 'repeat'
  --> /tmp/dojo-repeat-string-0.almd:7:48
  in call to repeat()
  hint: Check the function name
  |
7 | test "repeat 3 times" { assert_eq(repeat("ab", 3), "ababab") }
  |                                                ^
error[E002]: undefined function 'repeat'
  --> /tmp/dojo-repeat-string-0.almd:8:47
  in call to repeat()
  hint: Check the function name
  |
8 | test "repeat 0 times" { assert_eq(repeat("x", 0), "") }
  |                                               ^
error[E002]: undefined function 'repeat'
  --> /tmp/dojo-repeat-string-0.almd:9:50
  in call to repeat()
  hint: Check the function name
  |
9 | test "repeat 1 time" { assert_eq(repeat("hello", 1), "hello") }
  |                                                  ^
error[E002]: undefined function 'repeat'
  --> /tmp/dojo-repeat-string-0.almd:10:51
  in call to repeat()
  hint: Check the function name
   |
10 | test "repeat empty string" { assert_eq(repeat("", 5), "") }
   |                                                   ^
error[E002]: undefined function 'repeat'
  --> /tmp/dojo-repeat-string-0.almd:11:51
  in call to repeat()
  hint: Check the function name
   |
11 | test "repeat single char" { assert_eq(repeat("a", 4), "aaaa") }
   |                                                   ^

6 error(s) found
Compile error for /tmp/dojo-repeat-string-0.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then "" 
  else if n == 1 then s 
  else s + repeat(s, n - 1)
```
