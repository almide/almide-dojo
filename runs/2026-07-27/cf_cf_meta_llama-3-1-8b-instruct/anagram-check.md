# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) &&
  list.sort(list.filter(string.chars(a), fn(x) => x != " ")) == 
  list.sort(list.filter(string.chars(b), fn(x) => x != " "))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: '&&' is not valid in Almide at line 2:44
  --> /tmp/dojo-anagram-check-0.almd:2:44
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   string.to_lower(a) == string.to_lower(b) &&
  |                                            ^
error: Expected function name at line 3:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:44
  |
3 |   list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                            ^
error: Expected function name at line 4:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:4:44
  |
4 |   list.sort(list.filter(string.chars(b), fn(x) => x != " "))
  |                                            ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) 
  and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) == 
  list.sort(list.filter(string.chars(b), fn(x) => x != " "))

fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) 
  and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) = 
  list.sort(list.filter(string.chars(b), fn(x) => x != " "))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 3:46 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:46
  |
3 |   and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                              ^
error: Expected function name at line 3:48 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:3:48
  |
3 |   and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                                ^
error: Expected function name at line 4:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:4:44
  |
4 |   list.sort(list.filter(string.chars(b), fn(x) => x != " "))
  |                                            ^
error: Expected expression at line 8:46 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:8:46
  |
8 |   and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) =
  |                                              ^
error: Expected function name at line 8:48 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:8:48
  |
8 |   and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) =
  |                                                ^
error: Expected function name at line 9:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:9:44
  |
9 |   list.sort(list.filter(string.chars(b), fn(x) => x != " "))
  |                                            ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) 
  and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) = 
  list.sort(list.filter(string.chars(b), fn(x) => x != " "))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 3:46 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:46
  |
3 |   and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) =
  |                                              ^
error: Expected function name at line 3:48 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:3:48
  |
3 |   and list.sort(list.filter(string.chars(a), fn(x) => x != " ")) =
  |                                                ^
error: Expected function name at line 4:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:4:44
  |
4 |   list.sort(list.filter(string.chars(b), fn(x) => x != " "))
  |                                            ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) 
  and list.sort(list.map(string.chars(a), fn(x) => if x == " " then none else some(x)))) == 
  list.sort(list.map(string.chars(b), fn(x) => if x == " " then none else some(x))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 3:43 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:43
  |
3 |   and list.sort(list.map(string.chars(a), fn(x) => if x == " " then none else some(x)))) ==
  |                                           ^
error: Expected function name at line 3:45 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:3:45
  |
3 |   and list.sort(list.map(string.chars(a), fn(x) => if x == " " then none else some(x)))) ==
  |                                             ^
error: Expected function name at line 4:41 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:4:41
  |
4 |   list.sort(list.map(string.chars(b), fn(x) => if x == " " then none else some(x))))
  |                                         ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
