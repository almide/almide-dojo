# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, xs.head, (max, x) => if x > max then x else max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    match xs {
      some(x) => x,
      none => 
        match xs {
          some(x) => x,
          none => 
            match xs {
              some(x) => x,
              none => none
            }
        }
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 6 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  match xs {
    none => none,
    some(x) => 
      match xs {
        none => some(x),
        some(y) => 
          if x > y then some(x) else some(y)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 4 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    list.fold(xs, some(xs.head), (acc, x) => 
      if x > acc then some(x) else acc
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Option[Option[Int]], Option[Option[Int]]) -> Option[Option[Option[Int]]]
  --> /tmp/dojo-max-of-list-3.almd:5:36
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |       if x > acc then some(x) else acc
  |                                    ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
