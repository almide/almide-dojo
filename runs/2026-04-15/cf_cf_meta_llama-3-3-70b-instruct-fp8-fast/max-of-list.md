# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else some(list.fold(xs, xs.head, (max, x) => if max > x then max else x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else some(list.fold(xs, xs.head, (max, x) => if max >= x then max else x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else some(list.fold(xs, xs.head, (max, x) => if max > x then max else x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else some(list.fold(xs, xs.head, (max, x) => if max >= x then max else x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
