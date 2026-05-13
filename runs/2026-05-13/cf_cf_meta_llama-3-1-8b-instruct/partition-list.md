# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  val (matching, non_matching) = list.partition(xs, predicate)
  (matching, non_matching)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-partition-list-0.almd:2:32
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
2 |   val (matching, non_matching) = list.partition(xs, predicate)
  |                                ^
error[E003]: undefined variable 'matching'
  --> /tmp/dojo-partition-list-0.almd:2:8
  in variable matching
  hint: Check the variable name
  |
2 |   val (matching, non_matching) = list.partition(xs, predicate)
  |        ^^^^^^^^
error[E003]: undefined variable 'non_matching'
  --> /tmp/dojo-partition-list-0.almd:2:18
  in variable non_matching
  hint: Check the variable name
  |
2 |   val (matching, non_matching) = list.partition(xs, predicate)
  |                  ^^^^^^^^^^^^
error[E002]: undefined function 'val'
  --> /tmp/dojo-partition-list-0.almd:2:18
  in call to val()
  hint: Check the function name
  |
2 |   val (matching, non_matching) = list.partition(xs, predicate)
  |                  ^^^^^^^^^^^^
error[E001]: type mismatch in fn 'partition': expected (List[Int], List[Int]) but got Unit
  --> /tmp/dojo-partition-list-0.almd:2:18
  in fn 'partition'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to (List[Int], List[Int]):
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type (List[Int], List[Int])
  |
2 |   val (matching, non_matching) = list.partition(xs, predicate)
  |                  ^^^^^^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  let matching = list.filter(xs, predicate)
  let non_matching = list.filter(xs, (x) => !predicate(x))
  (matching, non_matching)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error: '!' is not valid in Almide at line 3:45
  --> /tmp/dojo-partition-list-1.almd:3:45
  hint: Use 'not' for boolean negation. Write: not x
  |
3 |   let non_matching = list.filter(xs, (x) => !predicate(x))
  |                                             ^
error[E001]: type mismatch in fn 'partition': expected (List[Int], List[Int]) but got Unit
  --> /tmp/dojo-partition-list-1.almd:2:34
  in fn 'partition'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to (List[Int], List[Int]):
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type (List[Int], List[Int])
  |
2 |   let matching = list.filter(xs, predicate)
  |                                  ^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  let matching = list.filter(xs, predicate)
  let non_matching = list.filter(xs, (x) => not predicate(x))
  (matching, non_matching)
}
```
