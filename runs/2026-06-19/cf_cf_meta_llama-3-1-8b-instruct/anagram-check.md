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
  list.sort(string.chars(string.drop(a, string.len(string.chars(a))))) == 
  list.sort(string.chars(string.drop(b, string.len(string.chars(b)))))
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

1 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) and
  list.sort(string.chars(string.drop(string.filter(string.chars(a), fn(x) => x != " ")), list.len(string.chars(a)))) == 
  list.sort(string.chars(string.drop(string.filter(string.chars(b), fn(x) => x != " ")), list.len(string.chars(b))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 3:69 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:69
  |
3 |   list.sort(string.chars(string.drop(string.filter(string.chars(a), fn(x) => x != " ")), list.len(string.chars(a)))) ==
  |                                                                     ^
error: Expected function name at line 3:71 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:3:71
  |
3 |   list.sort(string.chars(string.drop(string.filter(string.chars(a), fn(x) => x != " ")), list.len(string.chars(a)))) ==
  |                                                                       ^
error: Expected function name at line 4:71 (got LParen '(')
  --> /tmp/dojo-anagram-check-1.almd:4:71
  |
4 |   list.sort(string.chars(string.drop(string.filter(string.chars(b), fn(x) => x != " ")), list.len(string.chars(b))))
  |                                                                       ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) and
  list.sort(string.chars(string.drop(string.filter(string.chars(a), fn(x) => x != " ")), list.len(string.chars(a)))) == 
  list.sort(string.chars(string.drop(string.filter(string.chars(b), fn(x) => x != " ")), list.len(string.chars(b))))

fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) and
  list.sort(list.filter(string.chars(a), fn(x) => x != " ")) == 
  list.sort(list.filter(string.chars(b), fn(x) => x != " "))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 3:69 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:69
  |
3 |   list.sort(string.chars(string.drop(string.filter(string.chars(a), fn(x) => x != " ")), list.len(string.chars(a)))) ==
  |                                                                     ^
error: Expected function name at line 3:71 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:3:71
  |
3 |   list.sort(string.chars(string.drop(string.filter(string.chars(a), fn(x) => x != " ")), list.len(string.chars(a)))) ==
  |                                                                       ^
error: Expected function name at line 4:71 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:4:71
  |
4 |   list.sort(string.chars(string.drop(string.filter(string.chars(b), fn(x) => x != " ")), list.len(string.chars(b))))
  |                                                                       ^
error: Expected expression at line 8:42 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:8:42
  |
8 |   list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                          ^
error: Expected function name at line 8:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:8:44
  |
8 |   list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                            ^
error: Expected function name at line 9:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-2.almd:9:44
  |
9 |   list.sort(list.filter(string.chars(b), fn(x) => x != " "))
  |                                            ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) == string.to_lower(b) and
  list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  list.sort(list.filter(string.chars(b), fn(x) => x != " "))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 3:42 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:42
  |
3 |   list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                          ^
error: Expected function name at line 3:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:3:44
  |
3 |   list.sort(list.filter(string.chars(a), fn(x) => x != " ")) ==
  |                                            ^
error: Expected function name at line 4:44 (got LParen '(')
  --> /tmp/dojo-anagram-check-3.almd:4:44
  |
4 |   list.sort(list.filter(string.chars(b), fn(x) => x != " "))
  |                                            ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
