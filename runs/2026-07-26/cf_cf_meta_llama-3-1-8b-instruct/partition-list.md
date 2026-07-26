# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match xs {
    none => (list.new[Int](), list.new[Int]()),
    some(x) => 
      let (matching, non_matching) = 
        match predicate(x) {
          true => 
            match list.partition(xs, predicate) {
              some((m, n)) => (m, n),
              none => (list.new[Int](), non_matching)
            },
          false => 
            match list.partition(xs, predicate) {
              some((m, n)) => (matching, n),
              none => (matching, list.new[Int]())
            }
        }
      (matching, non_matching)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-partition-list-0.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let (matching, non_matching) =
  |       ^^^

1 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match xs {
    none => (list.new[Int](), list.new[Int]()),
    some(x) => 
      match predicate(x) {
        true => 
          let matching = list.filter(xs, predicate)
          let non_matching = list.filter(xs, (y) => !predicate(y))
          (matching, non_matching),
        false => 
          let matching = list.filter(xs, predicate)
          let non_matching = list.filter(xs, (y) => !predicate(y))
          (matching, non_matching)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-partition-list-1.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let matching = list.filter(xs, predicate)
  |           ^^^

1 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match xs {
    none => (list.new[Int](), list.new[Int]()),
    some(x) => 
      match predicate(x) {
        true => 
          (list.filter(xs, predicate), list.filter(xs, (y) => !predicate(y))),
        false => 
          (list.filter(xs, predicate), list.filter(xs, (y) => !predicate(y)))
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-2.almd
error: '!' is not valid in Almide at line 7:63
  --> /tmp/dojo-partition-list-2.almd:7:63
  hint: Use 'not' for boolean negation. Write: not x
  |
7 |           (list.filter(xs, predicate), list.filter(xs, (y) => !predicate(y))),
  |                                                               ^

1 error(s) found
Compile error for /tmp/dojo-partition-list-2.almd:
compile failed
FAILED: /tmp/dojo-partition-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match xs {
    none => (list.new[Int](), list.new[Int]()),
    some(x) => 
      match predicate(x) {
        true => 
          (list.filter(xs, predicate), list.filter(xs, (y) => not predicate(y))),
        false => 
          (list.filter(xs, predicate), list.filter(xs, (y) => not predicate(y)))
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-partition-list-3.almd:3:22
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     none => (list.new[Int](), list.new[Int]()),
  |                      ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-partition-list-3.almd:3:39
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     none => (list.new[Int](), list.new[Int]()),
  |                                       ^

2 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
