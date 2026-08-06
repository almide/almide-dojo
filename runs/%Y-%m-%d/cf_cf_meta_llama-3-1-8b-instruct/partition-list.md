# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match xs {
    none => (list.new[Int](), list.new[Int]())
    some(x) => 
      match predicate(x) {
        some(_) => 
          match list.partition(xs.drop(1), predicate) {
            some((matching, non_matching)) => (x :: matching, non_matching)
            none => (list.new[Int](), x :: list.new[Int]())
          }
        none => 
          match list.partition(xs.drop(1), predicate) {
            some((matching, non_matching)) => (matching, x :: non_matching)
            none => (x :: list.new[Int](), list.new[Int]())
          }
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: Expected ')' to close parenthesized expression opened at line 8:47
  --> /tmp/dojo-partition-list-0.almd:8:50
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |             some((matching, non_matching)) => (x :: matching, non_matching)
  |                                               --------------- '(' opened here
  |
8 |             some((matching, non_matching)) => (x :: matching, non_matching)
  |                                                  ^

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
    none => (list.new[Int](), list.new[Int]())
    some(x) => 
      match predicate(x) {
        some(_) => 
          match list.partition(xs.drop(1), predicate) {
            some((matching, non_matching)) => (x :: matching, non_matching)
            none => (list.new[Int](), x :: list.new[Int]())
          }
        none => 
          match list.partition(xs.drop(1), predicate) {
            some((matching, non_matching)) => (matching, x :: non_matching)
            none => (x :: list.new[Int](), list.new[Int]())
          }
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error: Expected ')' to close parenthesized expression opened at line 8:47
  --> /tmp/dojo-partition-list-1.almd:8:50
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |             some((matching, non_matching)) => (x :: matching, non_matching)
  |                                               --------------- '(' opened here
  |
8 |             some((matching, non_matching)) => (x :: matching, non_matching)
  |                                                  ^

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
    none => (list.new[Int](), list.new[Int]())
    some(x) => 
      match predicate(x) {
        some(_) => 
          let (matching, non_matching) = list.partition(xs.drop(1), predicate);
          (x :: matching, non_matching)
        none => 
          let (matching, non_matching) = list.partition(xs.drop(1), predicate);
          (matching, x :: non_matching)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-partition-list-2.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let (matching, non_matching) = list.partition(xs.drop(1), predicate);
  |           ^^^

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
    none => (list.new[Int](), list.new[Int]())
    some(x) => 
      match predicate(x) {
        some(_) => 
          let matching = list.partition(xs.drop(1), predicate);
          let non_matching = matching._2;
          (x :: matching._1, non_matching)
        none => 
          let matching = list.partition(xs.drop(1), predicate);
          let non_matching = matching._1;
          (matching._2, x :: non_matching)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-partition-list-3.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let matching = list.partition(xs.drop(1), predicate);
  |           ^^^

1 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
