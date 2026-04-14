# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Attempts

### Attempt 1 (FAIL)

```almide
def reverse(s: String): String = s.reverse
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-string-reverse-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def reverse(s: String): String = s.reverse
  | ^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:3:49
  in call to reverse()
  hint: Check the function name
  |
3 | test "reverse empty string" { assert_eq(reverse(""), "") }
  |                                                 ^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:4:48
  in call to reverse()
  hint: Check the function name
  |
4 | test "reverse single char" { assert_eq(reverse("a"), "a") }
  |                                                ^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:5:42
  in call to reverse()
  hint: Check the function name
  |
5 | test "reverse hello" { assert_eq(reverse("hello"), "olleh") }
  |                                          ^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:6:54
  in call to reverse()
  hint: Check the function name
  |
6 | test "reverse racecar is itself" { assert_eq(reverse("racecar"), "racecar") }
  |                                                      ^^^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:7:42
  in call to reverse()
  hint: Check the function name
  |
7 | test "reverse abcde" { assert_eq(reverse("abcde"), "edcba") }
  |                                          ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn reverse(s: String) -> String = string.reverse(s)
```
