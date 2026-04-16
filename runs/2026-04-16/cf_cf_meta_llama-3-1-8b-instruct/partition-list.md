# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) {
  (list.filter(xs, predicate), list.filter(xs, (x) => !predicate(x)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: Missing '=' before function body at line 1:81
  --> /tmp/dojo-partition-list-0.almd:1:81
  hint: Almide requires '=' before the body. Write: fn partition(...) -> Type = { ... }
  |
1 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) {
  |                                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  (list.filter(xs, predicate), list.filter(xs, (x) => !predicate(x)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error: '!' is not valid in Almide at line 2:55
  --> /tmp/dojo-partition-list-1.almd:2:55
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   (list.filter(xs, predicate), list.filter(xs, (x) => !predicate(x)))
  |                                                       ^
error[E001]: type mismatch in fn 'partition': expected (List[Int], List[Int]) but got Unit
  --> /tmp/dojo-partition-list-1.almd:1:83
  in fn 'partition'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to (List[Int], List[Int]):
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type (List[Int], List[Int])
  |
1 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  |                                                                                   ^

2 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  (list.filter(xs, predicate), list.filter(xs, (x) => not predicate(x)))
}
```
