# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else match list.max(xs) { some(x) => some(x) | none => none }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected pattern at line 3:48 (got Pipe '|')
  --> /tmp/dojo-max-of-list-0.almd:3:48
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   else match list.max(xs) { some(x) => some(x) | none => none }
  |                                                ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else match list.max(xs) { some(x) => some(x) | none => none }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected pattern at line 3:48 (got Pipe '|')
  --> /tmp/dojo-max-of-list-1.almd:3:48
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   else match list.max(xs) { some(x) => some(x) | none => none }
  |                                                ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else match list.max(xs) { some(x) => some(x) | _ => none }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected pattern at line 3:48 (got Pipe '|')
  --> /tmp/dojo-max-of-list-2.almd:3:48
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   else match list.max(xs) { some(x) => some(x) | _ => none }
  |                                                ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else match list.max(xs) { some(x) => some(x) | none => none }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected pattern at line 3:48 (got Pipe '|')
  --> /tmp/dojo-max-of-list-3.almd:3:48
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   else match list.max(xs) { some(x) => some(x) | none => none }
  |                                                ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
