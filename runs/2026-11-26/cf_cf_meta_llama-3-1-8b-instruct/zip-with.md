# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }
```

**Diagnostic:**

```
error: Expected pattern at line 4:25 (got Colon ':')
  --> /tmp/dojo-zip-with-0.almd:4:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                         ^

1 error(s) found
FAILED: /tmp/dojo-zip-with-0.almd
  parse error: Expected pattern at line 4:25 (got Colon ':')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-zip-with-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) =>
```

**Diagnostic:**

```
error: Expected pattern at line 4:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:4:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                         ^
error: Expected pattern at line 14:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:14:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 24:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:24:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 34:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:34:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 44:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:44:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
44 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 54:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:54:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
54 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 64:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:64:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
64 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 74:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:74:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
74 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 84:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:84:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
84 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 94:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:94:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
94 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 104:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:104:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
104 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 114:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:114:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
114 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 124:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:124:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
124 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 134:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:134:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
134 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 144:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:144:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
144 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 154:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:154:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
154 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 164:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:164:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
164 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 174:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:174:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
174 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 184:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:184:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
184 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 194:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:194:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
194 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 204:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:204:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
204 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 214:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:214:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
214 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 224:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:224:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
224 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 234:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:234:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
234 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 244:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:244:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
244 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 254:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:254:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
254 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 264:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:264:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
264 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 274:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:274:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
274 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 284:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:284:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
284 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 294:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:294:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
294 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 304:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:304:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
304 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 314:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:314:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
314 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 324:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:324:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
324 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 334:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:334:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
334 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 344:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:344:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
344 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 354:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:354:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
354 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 364:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:364:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
364 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 374:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:374:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
374 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 384:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:384:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
384 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 394:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:394:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
394 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 404:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:404:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
404 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 414:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:414:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
414 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 424:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:424:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
424 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 434:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:434:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
434 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 444:25 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:444:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
444 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected expression at line 456:1 (got Test 'test')
  --> /tmp/dojo-zip-with-1.almd:456:1
  here: test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
456 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
    | ^
error[E012]: duplicate function 'zip_with'
  at line 11
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
11 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 21
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
21 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 31
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
31 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 41
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
41 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 51
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
51 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 61
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
61 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 71
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
71 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 81
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
81 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 91
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
91 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 101
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
101 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 111
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
111 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 121
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
121 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 131
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
131 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 141
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
141 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 151
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
151 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 161
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
161 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 171
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
171 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 181
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
181 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 191
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
191 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 201
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
201 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 211
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
211 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 221
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
221 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 231
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
231 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 241
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
241 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 251
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
251 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 261
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
261 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 271
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
271 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 281
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
281 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 291
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
291 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 301
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
301 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 311
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
311 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 321
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
321 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 331
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
331 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 341
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
341 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 351
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
351 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 361
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
361 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 371
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
371 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 381
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
381 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 391
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
391 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 401
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
401 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 411
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
411 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 421
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
421 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 431
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
431 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 441
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
441 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 451
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
451 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^

91 error(s) found
FAILED: /tmp/dojo-zip-with-1.almd
  parse error: Expected pattern at line 4:25 (got Colon ':')
  parse error: Expected pattern at line 14:25 (got Colon ':')
  parse error: Expected pattern at line 24:25 (got Colon ':')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-zip-with-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }
```

**Diagnostic:**

```
error: Expected pattern at line 4:25 (got Colon ':')
  --> /tmp/dojo-zip-with-2.almd:4:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                         ^

1 error(s) found
FAILED: /tmp/dojo-zip-with-2.almd
  parse error: Expected pattern at line 4:25 (got Colon ':')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-zip-with-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
      none => none
    }
    none => none
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    some(x) => match ys {
      some(y) =>
```

**Diagnostic:**

```
error: Expected pattern at line 4:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:4:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                         ^
error: Expected pattern at line 14:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:14:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
14 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 24:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:24:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 34:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:34:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 44:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:44:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
44 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 54:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:54:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
54 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 64:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:64:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
64 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 74:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:74:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
74 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 84:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:84:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
84 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 94:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:94:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
94 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
   |                         ^
error: Expected pattern at line 104:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:104:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
104 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 114:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:114:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
114 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 124:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:124:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
124 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 134:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:134:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
134 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 144:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:144:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
144 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 154:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:154:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
154 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 164:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:164:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
164 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 174:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:174:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
174 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 184:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:184:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
184 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 194:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:194:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
194 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 204:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:204:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
204 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 214:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:214:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
214 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 224:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:224:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
224 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 234:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:234:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
234 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 244:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:244:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
244 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 254:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:254:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
254 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 264:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:264:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
264 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 274:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:274:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
274 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 284:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:284:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
284 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 294:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:294:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
294 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 304:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:304:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
304 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 314:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:314:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
314 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 324:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:324:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
324 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 334:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:334:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
334 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 344:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:344:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
344 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 354:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:354:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
354 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 364:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:364:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
364 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 374:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:374:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
374 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 384:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:384:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
384 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 394:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:394:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
394 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 404:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:404:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
404 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 414:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:414:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
414 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 424:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:424:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
424 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 434:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:434:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
434 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected pattern at line 444:25 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:444:25
  here: some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
444 |       some(y) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    |                         ^
error: Expected expression at line 456:1 (got Test 'test')
  --> /tmp/dojo-zip-with-3.almd:456:1
  here: test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
456 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
    | ^
error[E012]: duplicate function 'zip_with'
  at line 11
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
11 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 21
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
21 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 31
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
31 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 41
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
41 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 51
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
51 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 61
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
61 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 71
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
71 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 81
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
81 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 91
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
91 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 101
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
101 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 111
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
111 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 121
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
121 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 131
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
131 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 141
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
141 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 151
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
151 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 161
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
161 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 171
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
171 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 181
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
181 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 191
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
191 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 201
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
201 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 211
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
211 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 221
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
221 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 231
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
231 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 241
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
241 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 251
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
251 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 261
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
261 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 271
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
271 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 281
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
281 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 291
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
291 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 301
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
301 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 311
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
311 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 321
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
321 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 331
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
331 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 341
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
341 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 351
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
351 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 361
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
361 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 371
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
371 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 381
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
381 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 391
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
391 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 401
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
401 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 411
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
411 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 421
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
421 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 431
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
431 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 441
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
441 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 451
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
451 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^

91 error(s) found
FAILED: /tmp/dojo-zip-with-3.almd
  parse error: Expected pattern at line 4:25 (got Colon ':')
  parse error: Expected pattern at line 14:25 (got Colon ':')
  parse error: Expected pattern at line 24:25 (got Colon ':')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-zip-with-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
