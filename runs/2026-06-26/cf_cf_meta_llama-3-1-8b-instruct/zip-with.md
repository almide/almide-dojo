# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with[A, B, C](xs: List[A], ys: List[B], f: (A, B) -> C) -> List[C] = 
  match xs, ys with 
  | none, _ -> List()
  | _, none -> List()
  | some(x), some(y) -> 
    let pair = (x, y)
    let result = f(pair)
    let rest_x = list.drop(xs, 1)
    let rest_y = list.drop(ys, 1)
    result + zip_with(rest_x, rest_y, f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Expected LBrace at line 2:11 (got Comma ',')
  --> /tmp/dojo-zip-with-0.almd:2:11
  |
2 |   match xs, ys with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with[A, B, C](xs: List[A], ys: List[B], f: (A, B) -> C) -> List[C] = 
  match xs, ys with 
  | none, _ -> List()
  | _, none -> List()
  | some(x), some(y) -> 
    let pair = (x, y)
    let result = f(pair)
    let rest_x = list.drop(xs, 1)
    let rest_y = list.drop(ys, 1)
    result + zip_with(rest_x, rest_y, f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error: Expected LBrace at line 2:11 (got Comma ',')
  --> /tmp/dojo-zip-with-1.almd:2:11
  |
2 |   match xs, ys with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with[A, B, C](xs: List[A], ys: List[B], f: (A, B) -> C) -> List[C] = 
  match xs, ys with 
  | none, _ -> List()
  | _, none -> List()
  | some(x), some(y) -> 
    let pair = (x, y)
    let result = f(pair)
    let rest_x = list.drop(xs, 1)
    let rest_y = list.drop(ys, 1)
    result + zip_with(rest_x, rest_y, f)

fn zip_with[A, B, C](xs: List[A], ys: List[B], f: (A, B) -> C) -> List[C] = 
  match (xs, ys) with 
  | none, _ -> List()
  | _, none -> List()
  | some(x), some(y) -> 
    let pair = (x, y)
    let result = f(pair)
    let rest_x = list.drop(xs, 1)
    let rest_y = list.drop(ys, 1)
    result + zip_with(rest_x, rest_y, f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected LBrace at line 2:11 (got Comma ',')
  --> /tmp/dojo-zip-with-2.almd:2:11
  |
2 |   match xs, ys with
  |           ^
error: Expected LBrace at line 13:18 (got Ident 'with')
  --> /tmp/dojo-zip-with-2.almd:13:18
   |
13 |   match (xs, ys) with
   |                  ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with[A, B, C](xs: List[A], ys: List[B], f: (A, B) -> C) -> List[C] = 
  match xs, ys with 
  | none, _ -> List()
  | _, none -> List()
  | some(x), some(y) -> 
    let pair = (x, y)
    let result = f(pair)
    let rest_x = list.drop(xs, 1)
    let rest_y = list.drop(ys, 1)
    result + zip_with(rest_x, rest_y, f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected LBrace at line 2:11 (got Comma ',')
  --> /tmp/dojo-zip-with-3.almd:2:11
  |
2 |   match xs, ys with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
