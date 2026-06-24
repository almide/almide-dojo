# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
        sa = clean(a) |> list.sort
        sb = clean(b) |> list.sort
    in 
        sa == sb
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected ')' to close parenthesized expression opened at line 3:17
  --> /tmp/dojo-anagram-check-0.almd:3:83
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                 --------------- '(' opened here
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                                                                                   ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:5
  |
6 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:20
  in call to clean()
  hint: Check the function name
  |
4 |         sa = clean(a) |> list.sort
  |                    ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:20
  in call to clean()
  hint: Check the function name
  |
5 |         sb = clean(b) |> list.sort
  |                    ^
error[E003]: undefined variable 'sa'
  --> /tmp/dojo-anagram-check-0.almd:7:9
  in variable sa
  hint: Did you mean `a`?
  try:
      // sa  →  a
      a
  |
7 |         sa == sb
  |         ^^
error[E003]: undefined variable 'sb'
  --> /tmp/dojo-anagram-check-0.almd:7:15
  in variable sb
  hint: Did you mean `b`?
  try:
      // sb  →  b
      b
  |
7 |         sa == sb
  |               ^^

7 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (x) => string.to_lower(x) |> string.chars |> list.filter((x) => x != " ")
        sa = clean(a) |> list.sort
        sb = clean(b) |> list.sort
    in 
        sa == sb
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:6:5
  |
6 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:4:20
  in call to clean()
  hint: Check the function name
  |
4 |         sa = clean(a) |> list.sort
  |                    ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:5:20
  in call to clean()
  hint: Check the function name
  |
5 |         sb = clean(b) |> list.sort
  |                    ^
error[E003]: undefined variable 'sa'
  --> /tmp/dojo-anagram-check-1.almd:7:9
  in variable sa
  hint: Did you mean `a`?
  try:
      // sa  →  a
      a
  |
7 |         sa == sb
  |         ^^
error[E003]: undefined variable 'sb'
  --> /tmp/dojo-anagram-check-1.almd:7:15
  in variable sb
  hint: Did you mean `b`?
  try:
      // sb  →  b
      b
  |
7 |         sa == sb
  |               ^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean = (x) => string.to_lower(x) |> string.chars |> list.filter((x) => x != " ")
    in 
        list.sort(clean(a)) == list.sort(clean(b))
```
