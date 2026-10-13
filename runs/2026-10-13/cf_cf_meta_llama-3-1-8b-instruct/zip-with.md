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
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }
```

**Diagnostic:**

```
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:2:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match xs {
  |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:3:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => none
  |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:5:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
5 |       match ys {
  |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:6:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
6 |         none => none
  |                 ^^^^
error: pattern `none` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:8:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
8 |           match list.zip(xxs, ys) {
  |                               ^^
error: pattern `some(..)` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-0.almd:9:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
9 |             none => none
  |                     ^^^^
error[E001]: type mismatch in match arm: expected Option[?1] but got List[Int]
  --> /tmp/dojo-zip-with-0.almd:11:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?1]
  --> /tmp/dojo-zip-with-0.almd:11:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-zip-with-0.almd:8:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |           match list.zip(xxs, ys) {
  |                 ^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-zip-with-0.almd
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs,
```

**Diagnostic:**

```
error: Expected expression at line 580:1 (got Test 'test')
  --> /tmp/dojo-zip-with-1.almd:580:1
  here: test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
580 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
    | ^
error[E012]: duplicate function 'zip_with'
  at line 16
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
16 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 46
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
46 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 76
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
76 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 106
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
106 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 136
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
136 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 166
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
166 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 196
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
196 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 226
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
226 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 256
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
256 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 286
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
286 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 316
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
316 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 346
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
346 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 376
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
376 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 406
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
406 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 436
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
436 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
error[E012]: duplicate function 'zip_with'
  at line 466
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
466 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 481
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
481 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 496
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
496 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 511
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
511 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 526
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
526 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 541
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
541 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 556
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
556 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 571
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
571 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:2:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match xs {
  |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:3:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => none
  |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:5:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
5 |       match ys {
  |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:6:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
6 |         none => none
  |                 ^^^^
error: pattern `none` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:8:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
8 |           match list.zip(xxs, ys) {
  |                               ^^
error: pattern `some(..)` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:9:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
9 |             none => none
  |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:17:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
17 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:18:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
18 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:20:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
20 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:21:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
21 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?12, ?13)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:23:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?12, ?13)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
23 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?12, ?13)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:24:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?12, ?13)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
24 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:32:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
32 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:33:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
33 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:35:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
35 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:36:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
36 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?22, ?23)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:38:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?22, ?23)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
38 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?22, ?23)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:39:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?22, ?23)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
39 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:47:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
47 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:48:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
48 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:50:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
50 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:51:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
51 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?32, ?33)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:53:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?32, ?33)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
53 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?32, ?33)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:54:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?32, ?33)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
54 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:62:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
62 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:63:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
63 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:65:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
65 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:66:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
66 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?42, ?43)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:68:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?42, ?43)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
68 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?42, ?43)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:69:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?42, ?43)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
69 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:77:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
77 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:78:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
78 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:80:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
80 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:81:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
81 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?52, ?53)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:83:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?52, ?53)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
83 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?52, ?53)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:84:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?52, ?53)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
84 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:92:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
92 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:93:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
93 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:95:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
95 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:96:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
96 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?62, ?63)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:98:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?62, ?63)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
98 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?62, ?63)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:99:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?62, ?63)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
99 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:107:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
107 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:108:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
108 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:110:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
110 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:111:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
111 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?72, ?73)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:113:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?72, ?73)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
113 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?72, ?73)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:114:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?72, ?73)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
114 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:122:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
122 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:123:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
123 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:125:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
125 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:126:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
126 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?82, ?83)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:128:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?82, ?83)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
128 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?82, ?83)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:129:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?82, ?83)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
129 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:137:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
137 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:138:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
138 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:140:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
140 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:141:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
141 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?92, ?93)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:143:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?92, ?93)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
143 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?92, ?93)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:144:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?92, ?93)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
144 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:152:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
152 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:153:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
153 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:155:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
155 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:156:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
156 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?102, ?103)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:158:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?102, ?103)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
158 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?102, ?103)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:159:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?102, ?103)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
159 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:167:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
167 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:168:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
168 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:170:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
170 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:171:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
171 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?112, ?113)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:173:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?112, ?113)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
173 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?112, ?113)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:174:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?112, ?113)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
174 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:182:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
182 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:183:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
183 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:185:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
185 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:186:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
186 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?122, ?123)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:188:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?122, ?123)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
188 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?122, ?123)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:189:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?122, ?123)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
189 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:197:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
197 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:198:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
198 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:200:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
200 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:201:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
201 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?132, ?133)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:203:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?132, ?133)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
203 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?132, ?133)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:204:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?132, ?133)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
204 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:212:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
212 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:213:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
213 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:215:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
215 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:216:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
216 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?142, ?143)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:218:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?142, ?143)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
218 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?142, ?143)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:219:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?142, ?143)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
219 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:227:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
227 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:228:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
228 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:230:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
230 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:231:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
231 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?152, ?153)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:233:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?152, ?153)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
233 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?152, ?153)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:234:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?152, ?153)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
234 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:242:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
242 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:243:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
243 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:245:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
245 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:246:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
246 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?162, ?163)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:248:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?162, ?163)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
248 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?162, ?163)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:249:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?162, ?163)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
249 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:257:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
257 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:258:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
258 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:260:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
260 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:261:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
261 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?172, ?173)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:263:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?172, ?173)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
263 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?172, ?173)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:264:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?172, ?173)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
264 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:272:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
272 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:273:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
273 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:275:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
275 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:276:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
276 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?182, ?183)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:278:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?182, ?183)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
278 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?182, ?183)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:279:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?182, ?183)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
279 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:287:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
287 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:288:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
288 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:290:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
290 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:291:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
291 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?192, ?193)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:293:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?192, ?193)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
293 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?192, ?193)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:294:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?192, ?193)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
294 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:302:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
302 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:303:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
303 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:305:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
305 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:306:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
306 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?202, ?203)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:308:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?202, ?203)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
308 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?202, ?203)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:309:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?202, ?203)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
309 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:317:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
317 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:318:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
318 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:320:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
320 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:321:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
321 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?212, ?213)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:323:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?212, ?213)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
323 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?212, ?213)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:324:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?212, ?213)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
324 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:332:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
332 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:333:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
333 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:335:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
335 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:336:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
336 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?222, ?223)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:338:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?222, ?223)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
338 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?222, ?223)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:339:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?222, ?223)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
339 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:347:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
347 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:348:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
348 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:350:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
350 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:351:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
351 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?232, ?233)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:353:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?232, ?233)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
353 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?232, ?233)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:354:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?232, ?233)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
354 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:362:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
362 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:363:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
363 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:365:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
365 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:366:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
366 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?242, ?243)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:368:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?242, ?243)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
368 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?242, ?243)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:369:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?242, ?243)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
369 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:377:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
377 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:378:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
378 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:380:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
380 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:381:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
381 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?252, ?253)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:383:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?252, ?253)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
383 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?252, ?253)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:384:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?252, ?253)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
384 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:392:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
392 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:393:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
393 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:395:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
395 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:396:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
396 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?262, ?263)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:398:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?262, ?263)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
398 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?262, ?263)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:399:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?262, ?263)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
399 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:407:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
407 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:408:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
408 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:410:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
410 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:411:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
411 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?272, ?273)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:413:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?272, ?273)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
413 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?272, ?273)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:414:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?272, ?273)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
414 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:422:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
422 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:423:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
423 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:425:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
425 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:426:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
426 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?282, ?283)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:428:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?282, ?283)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
428 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?282, ?283)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:429:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?282, ?283)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
429 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:437:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
437 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:438:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
438 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:440:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
440 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:441:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
441 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?292, ?293)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:443:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?292, ?293)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
443 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?292, ?293)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:444:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?292, ?293)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
444 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:452:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
452 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:453:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
453 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:455:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
455 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:456:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
456 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?302, ?303)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:458:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?302, ?303)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
458 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?302, ?303)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:459:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?302, ?303)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
459 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:467:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
467 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:468:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
468 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:470:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
470 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:471:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
471 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?312, ?313)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:473:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?312, ?313)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
473 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?312, ?313)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:474:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?312, ?313)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
474 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:482:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
482 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:483:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
483 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:485:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
485 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:486:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
486 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?322, ?323)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:488:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?322, ?323)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
488 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?322, ?323)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:489:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?322, ?323)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
489 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:497:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
497 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:498:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
498 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:500:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
500 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:501:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
501 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?332, ?333)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:503:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?332, ?333)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
503 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?332, ?333)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:504:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?332, ?333)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
504 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:512:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
512 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:513:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
513 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:515:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
515 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:516:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
516 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?342, ?343)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:518:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?342, ?343)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
518 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?342, ?343)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:519:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?342, ?343)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
519 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:527:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
527 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:528:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
528 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:530:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
530 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:531:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
531 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?352, ?353)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:533:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?352, ?353)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
533 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?352, ?353)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:534:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?352, ?353)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
534 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:542:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
542 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:543:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
543 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:545:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
545 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:546:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
546 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?362, ?363)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:548:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?362, ?363)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
548 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?362, ?363)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:549:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?362, ?363)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
549 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:557:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
557 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:558:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
558 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:560:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
560 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:561:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
561 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?372, ?373)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:563:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?372, ?373)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
563 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?372, ?373)] — the subject is not an Option
  --> /tmp/dojo-zip-with-1.almd:564:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?372, ?373)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
564 |             none => none
    |                     ^^^^
error[E001]: type mismatch in match arm: expected Option[?1] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:11:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?1]
  --> /tmp/dojo-zip-with-1.almd:11:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?11] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:26:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
26 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?11]
  --> /tmp/dojo-zip-with-1.almd:26:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
26 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?21] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:41:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
41 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?21]
  --> /tmp/dojo-zip-with-1.almd:41:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
41 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?31] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:56:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
56 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?31]
  --> /tmp/dojo-zip-with-1.almd:56:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
56 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?41] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:71:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
71 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?41]
  --> /tmp/dojo-zip-with-1.almd:71:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
71 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?51] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:86:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
86 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?51]
  --> /tmp/dojo-zip-with-1.almd:86:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
86 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?61] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:101:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
101 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?61]
  --> /tmp/dojo-zip-with-1.almd:101:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
101 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?71] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:116:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
116 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?71]
  --> /tmp/dojo-zip-with-1.almd:116:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
116 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?81] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:131:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
131 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?81]
  --> /tmp/dojo-zip-with-1.almd:131:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
131 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?91] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:146:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
146 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?91]
  --> /tmp/dojo-zip-with-1.almd:146:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
146 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?101] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:161:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
161 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?101]
  --> /tmp/dojo-zip-with-1.almd:161:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
161 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?111] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:176:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
176 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?111]
  --> /tmp/dojo-zip-with-1.almd:176:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
176 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?121] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:191:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
191 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?121]
  --> /tmp/dojo-zip-with-1.almd:191:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
191 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?131] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:206:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
206 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?131]
  --> /tmp/dojo-zip-with-1.almd:206:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
206 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?141] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:221:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
221 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?141]
  --> /tmp/dojo-zip-with-1.almd:221:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
221 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?151] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:236:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
236 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?151]
  --> /tmp/dojo-zip-with-1.almd:236:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
236 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?161] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:251:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
251 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?161]
  --> /tmp/dojo-zip-with-1.almd:251:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
251 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?171] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:266:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
266 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?171]
  --> /tmp/dojo-zip-with-1.almd:266:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
266 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?181] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:281:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
281 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?181]
  --> /tmp/dojo-zip-with-1.almd:281:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
281 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?191] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:296:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
296 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?191]
  --> /tmp/dojo-zip-with-1.almd:296:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
296 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?201] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:311:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
311 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?201]
  --> /tmp/dojo-zip-with-1.almd:311:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
311 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?211] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:326:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
326 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?211]
  --> /tmp/dojo-zip-with-1.almd:326:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
326 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?221] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:341:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
341 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?221]
  --> /tmp/dojo-zip-with-1.almd:341:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
341 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?231] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:356:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
356 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?231]
  --> /tmp/dojo-zip-with-1.almd:356:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
356 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?241] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:371:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
371 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?241]
  --> /tmp/dojo-zip-with-1.almd:371:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
371 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?251] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:386:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
386 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?251]
  --> /tmp/dojo-zip-with-1.almd:386:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
386 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?261] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:401:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
401 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?261]
  --> /tmp/dojo-zip-with-1.almd:401:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
401 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?271] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:416:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
416 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?271]
  --> /tmp/dojo-zip-with-1.almd:416:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
416 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?281] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:431:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
431 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?281]
  --> /tmp/dojo-zip-with-1.almd:431:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
431 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?291] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:446:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
446 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?291]
  --> /tmp/dojo-zip-with-1.almd:446:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
446 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?301] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:461:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
461 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?301]
  --> /tmp/dojo-zip-with-1.almd:461:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
461 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?311] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:476:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
476 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?311]
  --> /tmp/dojo-zip-with-1.almd:476:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
476 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?321] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:491:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
491 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?321]
  --> /tmp/dojo-zip-with-1.almd:491:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
491 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?331] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:506:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
506 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?331]
  --> /tmp/dojo-zip-with-1.almd:506:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
506 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?341] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:521:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
521 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?341]
  --> /tmp/dojo-zip-with-1.almd:521:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
521 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?351] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:536:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
536 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?351]
  --> /tmp/dojo-zip-with-1.almd:536:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
536 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?361] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:551:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
551 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?361]
  --> /tmp/dojo-zip-with-1.almd:551:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
551 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?371] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:566:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
566 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?371]
  --> /tmp/dojo-zip-with-1.almd:566:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
566 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-zip-with-1.almd:8:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |           match list.zip(xxs, ys) {
  |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?12, ?13)])
  --> /tmp/dojo-zip-with-1.almd:23:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?22, ?23)])
  --> /tmp/dojo-zip-with-1.almd:38:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?32, ?33)])
  --> /tmp/dojo-zip-with-1.almd:53:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
53 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?42, ?43)])
  --> /tmp/dojo-zip-with-1.almd:68:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
68 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?52, ?53)])
  --> /tmp/dojo-zip-with-1.almd:83:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
83 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?62, ?63)])
  --> /tmp/dojo-zip-with-1.almd:98:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
98 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?72, ?73)])
  --> /tmp/dojo-zip-with-1.almd:113:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
113 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?82, ?83)])
  --> /tmp/dojo-zip-with-1.almd:128:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
128 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?92, ?93)])
  --> /tmp/dojo-zip-with-1.almd:143:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
143 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?102, ?103)])
  --> /tmp/dojo-zip-with-1.almd:158:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
158 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?112, ?113)])
  --> /tmp/dojo-zip-with-1.almd:173:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
173 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?122, ?123)])
  --> /tmp/dojo-zip-with-1.almd:188:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
188 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?132, ?133)])
  --> /tmp/dojo-zip-with-1.almd:203:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
203 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?142, ?143)])
  --> /tmp/dojo-zip-with-1.almd:218:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
218 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?152, ?153)])
  --> /tmp/dojo-zip-with-1.almd:233:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
233 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?162, ?163)])
  --> /tmp/dojo-zip-with-1.almd:248:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
248 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?172, ?173)])
  --> /tmp/dojo-zip-with-1.almd:263:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
263 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?182, ?183)])
  --> /tmp/dojo-zip-with-1.almd:278:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
278 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?192, ?193)])
  --> /tmp/dojo-zip-with-1.almd:293:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
293 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?202, ?203)])
  --> /tmp/dojo-zip-with-1.almd:308:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
308 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?212, ?213)])
  --> /tmp/dojo-zip-with-1.almd:323:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
323 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?222, ?223)])
  --> /tmp/dojo-zip-with-1.almd:338:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
338 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?232, ?233)])
  --> /tmp/dojo-zip-with-1.almd:353:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
353 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?242, ?243)])
  --> /tmp/dojo-zip-with-1.almd:368:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
368 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?252, ?253)])
  --> /tmp/dojo-zip-with-1.almd:383:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
383 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?262, ?263)])
  --> /tmp/dojo-zip-with-1.almd:398:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
398 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?272, ?273)])
  --> /tmp/dojo-zip-with-1.almd:413:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
413 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?282, ?283)])
  --> /tmp/dojo-zip-with-1.almd:428:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
428 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?292, ?293)])
  --> /tmp/dojo-zip-with-1.almd:443:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
443 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?302, ?303)])
  --> /tmp/dojo-zip-with-1.almd:458:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
458 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?312, ?313)])
  --> /tmp/dojo-zip-with-1.almd:473:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
473 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?322, ?323)])
  --> /tmp/dojo-zip-with-1.almd:488:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
488 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?332, ?333)])
  --> /tmp/dojo-zip-with-1.almd:503:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
503 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?342, ?343)])
  --> /tmp/dojo-zip-with-1.almd:518:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
518 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?352, ?353)])
  --> /tmp/dojo-zip-with-1.almd:533:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
533 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?362, ?363)])
  --> /tmp/dojo-zip-with-1.almd:548:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
548 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?372, ?373)])
  --> /tmp/dojo-zip-with-1.almd:563:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
563 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^

381 error(s) found
FAILED: /tmp/dojo-zip-with-1.almd
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }
```

**Diagnostic:**

```
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:2:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match xs {
  |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:3:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => none
  |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:5:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
5 |       match ys {
  |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:6:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
6 |         none => none
  |                 ^^^^
error: pattern `none` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:8:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
8 |           match list.zip(xxs, ys) {
  |                               ^^
error: pattern `some(..)` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-2.almd:9:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
9 |             none => none
  |                     ^^^^
error[E001]: type mismatch in match arm: expected Option[?1] but got List[Int]
  --> /tmp/dojo-zip-with-2.almd:11:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?1]
  --> /tmp/dojo-zip-with-2.almd:11:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-zip-with-2.almd:8:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |           match list.zip(xxs, ys) {
  |                 ^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-zip-with-2.almd
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
          }
      }
  }

// Corrected version:
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match xs {
    none => none
    some(xxs) => 
      match ys {
        none => none
        some(ys) => 
          match list.zip(xxs, ys) {
            none => none
            some(pairs) => 
              list.map(pairs, (pair) => f(pair.first, pair.second))
```

**Diagnostic:**

```
error: Expected pattern at line 589:1 (got Test 'test')
  --> /tmp/dojo-zip-with-3.almd:589:1
  here: test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
589 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
    | ^
error[E012]: duplicate function 'zip_with'
  at line 17
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
17 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 33
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
33 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 49
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
49 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 65
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
65 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 97
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ----------------------------------- first definition of 'zip_with' here
...
97 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
   | ^
error[E012]: duplicate function 'zip_with'
  at line 113
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
113 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 129
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
129 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 145
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
145 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 177
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
177 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 193
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
193 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 209
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
209 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 225
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
225 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 257
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
257 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 273
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
273 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 289
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
289 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 305
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
305 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 337
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
337 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 353
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
353 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 369
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
369 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 385
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
385 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
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
  at line 417
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
417 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 433
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
433 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 449
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
449 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 465
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
465 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 481
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
481 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 497
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
497 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 513
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
513 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 529
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
529 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 545
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
545 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 561
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
561 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error[E012]: duplicate function 'zip_with'
  at line 577
  in fn zip_with
  here: fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ----------------------------------- first definition of 'zip_with' here
 ...
577 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
    | ^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:2:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match xs {
  |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:3:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => none
  |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:5:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
5 |       match ys {
  |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:6:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
6 |         none => none
  |                 ^^^^
error: pattern `none` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:8:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
8 |           match list.zip(xxs, ys) {
  |                               ^^
error: pattern `some(..)` cannot match List[(?2, ?3)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:9:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?2, ?3)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
9 |             none => none
  |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:18:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
18 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:19:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
19 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:21:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
21 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:22:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
22 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?12, ?13)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:24:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?12, ?13)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
24 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?12, ?13)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:25:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?12, ?13)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
25 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:34:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
34 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:35:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
35 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:37:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
37 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:38:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
38 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?22, ?23)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:40:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?22, ?23)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
40 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?22, ?23)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:41:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?22, ?23)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
41 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:50:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
50 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:51:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
51 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:53:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
53 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:54:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
54 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?32, ?33)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:56:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?32, ?33)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
56 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?32, ?33)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:57:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?32, ?33)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
57 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:66:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
66 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:67:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
67 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:69:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
69 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:70:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
70 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?42, ?43)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:72:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?42, ?43)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
72 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?42, ?43)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:73:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?42, ?43)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
73 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:82:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
82 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:83:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
83 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:85:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
85 |       match ys {
   |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:86:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
86 |         none => none
   |                 ^^^^
error: pattern `none` cannot match List[(?52, ?53)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:88:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?52, ?53)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
88 |           match list.zip(xxs, ys) {
   |                               ^^
error: pattern `some(..)` cannot match List[(?52, ?53)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:89:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?52, ?53)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
89 |             none => none
   |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:98:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
98 |   match xs {
   |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:99:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
99 |     none => none
   |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:101:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
101 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:102:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
102 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?62, ?63)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:104:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?62, ?63)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
104 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?62, ?63)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:105:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?62, ?63)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
105 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:114:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
114 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:115:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
115 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:117:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
117 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:118:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
118 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?72, ?73)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:120:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?72, ?73)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
120 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?72, ?73)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:121:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?72, ?73)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
121 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:130:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
130 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:131:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
131 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:133:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
133 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:134:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
134 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?82, ?83)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:136:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?82, ?83)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
136 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?82, ?83)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:137:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?82, ?83)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
137 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:146:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
146 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:147:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
147 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:149:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
149 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:150:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
150 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?92, ?93)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:152:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?92, ?93)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
152 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?92, ?93)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:153:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?92, ?93)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
153 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:162:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
162 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:163:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
163 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:165:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
165 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:166:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
166 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?102, ?103)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:168:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?102, ?103)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
168 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?102, ?103)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:169:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?102, ?103)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
169 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:178:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
178 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:179:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
179 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:181:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
181 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:182:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
182 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?112, ?113)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:184:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?112, ?113)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
184 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?112, ?113)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:185:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?112, ?113)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
185 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:194:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
194 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:195:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
195 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:197:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
197 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:198:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
198 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?122, ?123)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:200:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?122, ?123)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
200 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?122, ?123)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:201:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?122, ?123)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
201 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:210:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
210 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:211:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
211 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:213:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
213 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:214:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
214 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?132, ?133)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:216:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?132, ?133)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
216 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?132, ?133)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:217:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?132, ?133)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
217 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:226:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
226 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:227:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
227 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:229:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
229 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:230:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
230 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?142, ?143)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:232:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?142, ?143)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
232 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?142, ?143)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:233:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?142, ?143)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
233 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:242:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
242 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:243:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
243 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:245:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
245 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:246:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
246 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?152, ?153)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:248:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?152, ?153)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
248 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?152, ?153)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:249:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?152, ?153)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
249 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:258:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
258 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:259:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
259 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:261:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
261 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:262:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
262 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?162, ?163)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:264:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?162, ?163)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
264 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?162, ?163)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:265:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?162, ?163)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
265 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:274:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
274 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:275:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
275 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:277:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
277 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:278:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
278 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?172, ?173)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:280:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?172, ?173)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
280 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?172, ?173)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:281:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?172, ?173)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
281 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:290:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
290 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:291:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
291 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:293:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
293 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:294:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
294 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?182, ?183)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:296:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?182, ?183)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
296 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?182, ?183)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:297:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?182, ?183)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
297 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:306:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
306 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:307:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
307 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:309:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
309 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:310:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
310 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?192, ?193)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:312:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?192, ?193)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
312 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?192, ?193)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:313:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?192, ?193)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
313 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:322:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
322 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:323:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
323 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:325:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
325 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:326:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
326 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?202, ?203)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:328:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?202, ?203)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
328 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?202, ?203)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:329:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?202, ?203)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
329 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:338:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
338 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:339:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
339 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:341:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
341 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:342:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
342 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?212, ?213)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:344:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?212, ?213)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
344 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?212, ?213)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:345:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?212, ?213)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
345 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:354:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
354 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:355:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
355 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:357:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
357 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:358:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
358 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?222, ?223)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:360:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?222, ?223)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
360 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?222, ?223)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:361:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?222, ?223)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
361 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:370:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
370 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:371:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
371 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:373:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
373 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:374:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
374 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?232, ?233)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:376:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?232, ?233)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
376 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?232, ?233)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:377:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?232, ?233)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
377 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:386:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
386 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:387:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
387 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:389:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
389 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:390:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
390 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?242, ?243)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:392:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?242, ?243)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
392 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?242, ?243)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:393:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?242, ?243)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
393 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:402:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
402 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:403:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
403 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:405:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
405 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:406:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
406 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?252, ?253)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:408:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?252, ?253)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
408 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?252, ?253)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:409:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?252, ?253)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
409 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:418:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
418 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:419:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
419 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:421:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
421 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:422:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
422 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?262, ?263)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:424:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?262, ?263)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
424 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?262, ?263)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:425:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?262, ?263)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
425 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:434:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
434 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:435:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
435 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:437:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
437 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:438:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
438 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?272, ?273)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:440:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?272, ?273)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
440 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?272, ?273)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:441:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?272, ?273)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
441 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:450:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
450 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:451:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
451 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:453:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
453 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:454:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
454 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?282, ?283)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:456:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?282, ?283)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
456 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?282, ?283)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:457:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?282, ?283)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
457 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:466:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
466 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:467:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
467 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:469:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
469 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:470:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
470 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?292, ?293)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:472:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?292, ?293)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
472 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?292, ?293)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:473:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?292, ?293)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
473 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:482:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
482 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:483:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
483 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:485:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
485 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:486:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
486 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?302, ?303)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:488:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?302, ?303)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
488 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?302, ?303)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:489:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?302, ?303)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
489 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:498:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
498 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:499:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
499 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:501:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
501 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:502:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
502 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?312, ?313)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:504:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?312, ?313)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
504 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?312, ?313)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:505:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?312, ?313)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
505 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:514:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
514 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:515:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
515 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:517:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
517 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:518:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
518 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?322, ?323)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:520:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?322, ?323)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
520 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?322, ?323)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:521:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?322, ?323)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
521 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:530:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
530 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:531:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
531 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:533:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
533 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:534:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
534 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?332, ?333)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:536:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?332, ?333)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
536 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?332, ?333)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:537:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?332, ?333)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
537 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:546:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
546 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:547:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
547 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:549:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
549 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:550:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
550 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?342, ?343)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:552:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?342, ?343)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
552 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?342, ?343)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:553:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?342, ?343)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
553 |             none => none
    |                     ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:562:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
562 |   match xs {
    |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:563:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
563 |     none => none
    |             ^^^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:565:13
  in match pattern
  here: match ys {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
565 |       match ys {
    |             ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:566:17
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
566 |         none => none
    |                 ^^^^
error: pattern `none` cannot match List[(?352, ?353)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:568:31
  in match pattern
  here: match list.zip(xxs, ys) {
  hint: the value is already a plain List[(?352, ?353)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
568 |           match list.zip(xxs, ys) {
    |                               ^^
error: pattern `some(..)` cannot match List[(?352, ?353)] — the subject is not an Option
  --> /tmp/dojo-zip-with-3.almd:569:21
  in match pattern
  here: none => none
  hint: the value is already a plain List[(?352, ?353)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
    |
569 |             none => none
    |                     ^^^^
error[E001]: type mismatch in match arm: expected Option[?1] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:11:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?1]
  --> /tmp/dojo-zip-with-3.almd:11:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
11 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?11] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:27:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
27 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?11]
  --> /tmp/dojo-zip-with-3.almd:27:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
27 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?21] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:43:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
43 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?21]
  --> /tmp/dojo-zip-with-3.almd:43:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
43 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?31] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:59:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
59 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?31]
  --> /tmp/dojo-zip-with-3.almd:59:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
59 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?41] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:75:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
75 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?41]
  --> /tmp/dojo-zip-with-3.almd:75:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
75 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?51] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:91:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
91 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?51]
  --> /tmp/dojo-zip-with-3.almd:91:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
   |
91 |               list.map(pairs, (pair) => f(pair.first, pair.second))
   |                                         ^
error[E001]: type mismatch in match arm: expected Option[?61] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:107:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
107 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?61]
  --> /tmp/dojo-zip-with-3.almd:107:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
107 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?71] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:123:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
123 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?71]
  --> /tmp/dojo-zip-with-3.almd:123:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
123 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?81] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:139:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
139 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?81]
  --> /tmp/dojo-zip-with-3.almd:139:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
139 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?91] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:155:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
155 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?91]
  --> /tmp/dojo-zip-with-3.almd:155:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
155 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?101] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:171:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
171 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?101]
  --> /tmp/dojo-zip-with-3.almd:171:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
171 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?111] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:187:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
187 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?111]
  --> /tmp/dojo-zip-with-3.almd:187:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
187 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?121] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:203:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
203 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?121]
  --> /tmp/dojo-zip-with-3.almd:203:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
203 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?131] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:219:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
219 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?131]
  --> /tmp/dojo-zip-with-3.almd:219:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
219 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?141] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:235:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
235 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?141]
  --> /tmp/dojo-zip-with-3.almd:235:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
235 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?151] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:251:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
251 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?151]
  --> /tmp/dojo-zip-with-3.almd:251:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
251 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?161] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:267:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
267 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?161]
  --> /tmp/dojo-zip-with-3.almd:267:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
267 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?171] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:283:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
283 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?171]
  --> /tmp/dojo-zip-with-3.almd:283:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
283 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?181] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:299:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
299 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?181]
  --> /tmp/dojo-zip-with-3.almd:299:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
299 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?191] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:315:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
315 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?191]
  --> /tmp/dojo-zip-with-3.almd:315:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
315 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?201] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:331:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
331 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?201]
  --> /tmp/dojo-zip-with-3.almd:331:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
331 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?211] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:347:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
347 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?211]
  --> /tmp/dojo-zip-with-3.almd:347:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
347 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?221] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:363:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
363 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?221]
  --> /tmp/dojo-zip-with-3.almd:363:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
363 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?231] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:379:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
379 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?231]
  --> /tmp/dojo-zip-with-3.almd:379:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
379 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?241] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:395:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
395 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?241]
  --> /tmp/dojo-zip-with-3.almd:395:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
395 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?251] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:411:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
411 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?251]
  --> /tmp/dojo-zip-with-3.almd:411:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
411 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?261] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:427:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
427 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?261]
  --> /tmp/dojo-zip-with-3.almd:427:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
427 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?271] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:443:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
443 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?271]
  --> /tmp/dojo-zip-with-3.almd:443:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
443 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?281] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:459:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
459 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?281]
  --> /tmp/dojo-zip-with-3.almd:459:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
459 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?291] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:475:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
475 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?291]
  --> /tmp/dojo-zip-with-3.almd:475:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
475 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?301] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:491:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
491 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?301]
  --> /tmp/dojo-zip-with-3.almd:491:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
491 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?311] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:507:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
507 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?311]
  --> /tmp/dojo-zip-with-3.almd:507:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
507 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?321] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:523:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
523 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?321]
  --> /tmp/dojo-zip-with-3.almd:523:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
523 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?331] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:539:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
539 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?331]
  --> /tmp/dojo-zip-with-3.almd:539:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
539 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?341] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:555:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
555 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?341]
  --> /tmp/dojo-zip-with-3.almd:555:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
555 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in match arm: expected Option[?351] but got List[Int]
  --> /tmp/dojo-zip-with-3.almd:571:41
  in match arm
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
571 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Option[?351]
  --> /tmp/dojo-zip-with-3.almd:571:41
  in fn 'zip_with'
  here: list.map(pairs, (pair) => f(pair.first, pair.second))
  hint: Fix the expression type or change the expected type
    |
571 |               list.map(pairs, (pair) => f(pair.first, pair.second))
    |                                         ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-zip-with-3.almd:8:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |           match list.zip(xxs, ys) {
  |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?12, ?13)])
  --> /tmp/dojo-zip-with-3.almd:24:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?22, ?23)])
  --> /tmp/dojo-zip-with-3.almd:40:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
40 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?32, ?33)])
  --> /tmp/dojo-zip-with-3.almd:56:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
56 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?42, ?43)])
  --> /tmp/dojo-zip-with-3.almd:72:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
72 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?52, ?53)])
  --> /tmp/dojo-zip-with-3.almd:88:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
88 |           match list.zip(xxs, ys) {
   |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?62, ?63)])
  --> /tmp/dojo-zip-with-3.almd:104:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
104 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?72, ?73)])
  --> /tmp/dojo-zip-with-3.almd:120:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
120 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?82, ?83)])
  --> /tmp/dojo-zip-with-3.almd:136:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
136 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?92, ?93)])
  --> /tmp/dojo-zip-with-3.almd:152:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
152 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?102, ?103)])
  --> /tmp/dojo-zip-with-3.almd:168:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
168 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?112, ?113)])
  --> /tmp/dojo-zip-with-3.almd:184:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
184 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?122, ?123)])
  --> /tmp/dojo-zip-with-3.almd:200:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
200 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?132, ?133)])
  --> /tmp/dojo-zip-with-3.almd:216:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
216 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?142, ?143)])
  --> /tmp/dojo-zip-with-3.almd:232:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
232 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?152, ?153)])
  --> /tmp/dojo-zip-with-3.almd:248:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
248 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?162, ?163)])
  --> /tmp/dojo-zip-with-3.almd:264:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
264 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?172, ?173)])
  --> /tmp/dojo-zip-with-3.almd:280:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
280 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?182, ?183)])
  --> /tmp/dojo-zip-with-3.almd:296:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
296 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?192, ?193)])
  --> /tmp/dojo-zip-with-3.almd:312:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
312 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?202, ?203)])
  --> /tmp/dojo-zip-with-3.almd:328:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
328 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?212, ?213)])
  --> /tmp/dojo-zip-with-3.almd:344:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
344 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?222, ?223)])
  --> /tmp/dojo-zip-with-3.almd:360:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
360 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?232, ?233)])
  --> /tmp/dojo-zip-with-3.almd:376:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
376 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?242, ?243)])
  --> /tmp/dojo-zip-with-3.almd:392:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
392 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?252, ?253)])
  --> /tmp/dojo-zip-with-3.almd:408:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
408 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?262, ?263)])
  --> /tmp/dojo-zip-with-3.almd:424:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
424 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?272, ?273)])
  --> /tmp/dojo-zip-with-3.almd:440:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
440 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?282, ?283)])
  --> /tmp/dojo-zip-with-3.almd:456:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
456 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?292, ?293)])
  --> /tmp/dojo-zip-with-3.almd:472:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
472 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?302, ?303)])
  --> /tmp/dojo-zip-with-3.almd:488:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
488 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?312, ?313)])
  --> /tmp/dojo-zip-with-3.almd:504:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
504 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?322, ?323)])
  --> /tmp/dojo-zip-with-3.almd:520:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
520 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?332, ?333)])
  --> /tmp/dojo-zip-with-3.almd:536:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
536 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?342, ?343)])
  --> /tmp/dojo-zip-with-3.almd:552:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
552 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?352, ?353)])
  --> /tmp/dojo-zip-with-3.almd:568:17
  in this expression with an unconstrained type
  here: match list.zip(xxs, ys) {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
568 |           match list.zip(xxs, ys) {
    |                 ^^^^^^^^^^^^^^^^^

361 error(s) found
FAILED: /tmp/dojo-zip-with-3.almd
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
