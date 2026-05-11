# repeat-string

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then 
    ""
  else 
    _repeat(s, n) 
  end

fn _repeat(s: String, n: Int) -> String = 
  if n == 1 then 
    s 
  else 
    s + _repeat(s, n - 1) 
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-0.almd:6:3
  |
6 |   end
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-0.almd:13:3
   |
13 |   end
   |   ^

2 error(s) found
Compile error for /tmp/dojo-repeat-string-0.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then 
    ""
  else 
    _repeat(s, n) 
  end

fn _repeat(s: String, n: Int) -> String = 
  if n == 1 then 
    s 
  else 
    s + _repeat(s, n - 1) 
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-1.almd:6:3
  |
6 |   end
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-1.almd:13:3
   |
13 |   end
   |   ^

2 error(s) found
Compile error for /tmp/dojo-repeat-string-1.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then 
    ""
  else 
    _repeat(s, n) 
  end

fn _repeat(s: String, n: Int) -> String = 
  if n == 1 then 
    s 
  else 
    s + _repeat(s, n - 1) 
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-2.almd:6:3
  |
6 |   end
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-2.almd:13:3
   |
13 |   end
   |   ^

2 error(s) found
Compile error for /tmp/dojo-repeat-string-2.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then 
    ""
  else 
    _repeat(s, n) 
  end

fn _repeat(s: String, n: Int) -> String = 
  if n == 1 then 
    s 
  else 
    s + _repeat(s, n - 1) 
  end
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-3.almd:6:3
  |
6 |   end
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'end')
  --> /tmp/dojo-repeat-string-3.almd:13:3
   |
13 |   end
   |   ^

2 error(s) found
Compile error for /tmp/dojo-repeat-string-3.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-3.almd

1/1 test file(s) failed

```
