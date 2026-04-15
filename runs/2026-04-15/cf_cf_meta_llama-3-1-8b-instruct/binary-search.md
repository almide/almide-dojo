# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
    let len = list.len(xs);
    match len {
        0 => none,
        _ => {
            let (low, high) = (0, len - 1);
            while low <= high {
                let mid = (low + high) / 2;
                match list.get(xs, mid) {
                    some(mid_val) => {
                        if mid_val == target {
                            some(mid)
                        } else if mid_val < target {
                            low = mid + 1;
                        } else {
                            high = mid - 1;
                        }
                    },
                    none => {
                        high = mid - 1;
                    }
                }
            }
            match low {
                0 => list.get(xs, low),
                _ => list.get(xs, low - 1)
            }
        }
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Missing '=' before function body at line 1:61
  --> /tmp/dojo-binary-search-0.almd:1:61
  hint: Almide requires '=' before the body. Write: fn binary_search(...) -> Type = { ... }
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
  |                                                             ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let len = list.len(xs);
    match len {
        0 => none,
        _ => {
            let (low, high) = (0, len - 1);
            while low < high {
                let mid = (low + high) / 2;
                match list.get(xs, mid) {
                    some(mid_val) => {
                        if mid_val == target {
                            some(mid)
                        } else if mid_val < target {
                            low = mid + 1;
                        } else {
                            high = mid - 1;
                        }
                    },
                    none => {
                        high = mid - 1;
                    }
                }
            }
            match low {
                0 => list.get(xs, low),
                _ => list.get(xs, low - 1)
            }
        }
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected Then at line 11:46 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:11:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |                         if mid_val == target {
   |                                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:21 (got RBrace '}')
  --> /tmp/dojo-binary-search-1.almd:18:21
   |
18 |                     },
   |                     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:16:36
  in variable mid
  hint: Check the variable name
   |
16 |                             high = mid - 1;
   |                                    ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:16:42
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
   |
16 |                             high = mid - 1;
   |                                          ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let len = list.len(xs);
    match len {
        0 => none,
        _ => {
            let (low, high) = (0, len - 1);
            while low <= high {
                let mid = (low + high) / 2;
                match list.get(xs, mid) {
                    some(mid_val) => {
                        if mid_val == target {
                            some(mid)
                        } else if mid_val < target {
                            low = mid + 1;
                        } else {
                            high = mid - 1;
                        }
                    },
                    none => {
                        return none
                    }
                }
            }
            some(low)
        }
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 11:46 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:11:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |                         if mid_val == target {
   |                                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:21 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:18:21
   |
18 |                     },
   |                     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:16:36
  in variable mid
  hint: Check the variable name
   |
16 |                             high = mid - 1;
   |                                    ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:16:42
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
   |
16 |                             high = mid - 1;
   |                                          ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let len = list.len(xs);
    match len {
        0 => none,
        _ => {
            let (low, high) = (0, len - 1);
            while low <= high {
                let mid = (low + high) / 2;
                match list.get(xs, mid) {
                    some(mid_val) => {
                        if mid_val == target {
                            some(mid)
                        } else if mid_val < target {
                            low = mid + 1;
                        } else {
                            high = mid - 1;
                        }
                    },
                    none => {
                        return none
                    }
                }
            }
            some(low)
        }
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected Then at line 11:46 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:11:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |                         if mid_val == target {
   |                                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:21 (got RBrace '}')
  --> /tmp/dojo-binary-search-3.almd:18:21
   |
18 |                     },
   |                     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:16:36
  in variable mid
  hint: Check the variable name
   |
16 |                             high = mid - 1;
   |                                    ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:16:42
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
   |
16 |                             high = mid - 1;
   |                                          ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
