# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-0.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected expression at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error: Expected Then at line 8:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:8:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |       if mid_val == target {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 10:9 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:10:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |       } else if mid_val < target {
   |         ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:6:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:6:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                        ^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:7:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
7 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
  |                                  ^^^

8 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected expression at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error: Expected Then at line 8:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:8:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |       if mid_val == target {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 10:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:10:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |       } else if mid_val < target {
   |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:21:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
21 |   fn search(low: Int, high: Int) -> Option[Int] = {
   |   ^^
error: Expected Then at line 22:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:22:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |     if low > high {
   |                   ^
error: Expected expression at line 24:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:24:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     } else {
   |       ^
error: Expected Then at line 27:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:27:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
27 |       if mid_val == target {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 29:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:29:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |       } else if mid_val < target {
   |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:40:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
40 |   fn search(low: Int, high: Int) -> Option[Int] = {
   |   ^^
error: Expected Then at line 41:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:41:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
41 |     if low > high {
   |                   ^
error: Expected expression at line 43:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:43:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 |     } else {
   |       ^
error: Expected Then at line 46:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:46:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
46 |       if mid_val == target {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 48:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:48:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 |       } else if mid_val < target {
   |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:59:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
59 |   fn search(low: Int, high: Int) -> Option[Int] = {
   |   ^^
error: Expected Then at line 60:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:60:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
60 |     if low > high {
   |                   ^
error: Expected expression at line 62:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:62:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
62 |     } else {
   |       ^
error: Expected Then at line 65:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:65:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
65 |       if mid_val == target {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 67:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:67:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
67 |       } else if mid_val < target {
   |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:78:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
78 |   fn search(low: Int, high: Int) -> Option[Int] = {
   |   ^^
error: Expected Then at line 79:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:79:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
79 |     if low > high {
   |                   ^
error: Expected expression at line 81:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:81:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
81 |     } else {
   |       ^
error: Expected Then at line 84:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:84:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
84 |       if mid_val == target {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 86:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:86:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |       } else if mid_val < target {
   |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:97:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
97 |   fn search(low: Int, high: Int) -> Option[Int] = {
   |   ^^
error: Expected Then at line 98:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:98:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
98 |     if low > high {
   |                   ^
error: Expected expression at line 100:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:100:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
100 |     } else {
    |       ^
error: Expected Then at line 103:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:103:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
103 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 105:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:105:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
105 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:116:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
116 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 117:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:117:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
117 |     if low > high {
    |                   ^
error: Expected expression at line 119:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:119:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
119 |     } else {
    |       ^
error: Expected Then at line 122:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:122:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
122 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 124:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:124:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
124 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:135:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
135 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 136:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:136:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
136 |     if low > high {
    |                   ^
error: Expected expression at line 138:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:138:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
138 |     } else {
    |       ^
error: Expected Then at line 141:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:141:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
141 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 143:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:143:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
143 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:154:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
154 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 155:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:155:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
155 |     if low > high {
    |                   ^
error: Expected expression at line 157:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:157:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
157 |     } else {
    |       ^
error: Expected Then at line 160:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:160:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
160 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 162:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:162:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
162 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:173:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
173 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 174:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:174:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
174 |     if low > high {
    |                   ^
error: Expected expression at line 176:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:176:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
176 |     } else {
    |       ^
error: Expected Then at line 179:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:179:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
179 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 181:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:181:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
181 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:192:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
192 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 193:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:193:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
193 |     if low > high {
    |                   ^
error: Expected expression at line 195:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:195:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
195 |     } else {
    |       ^
error: Expected Then at line 198:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:198:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
198 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 200:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:200:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
200 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:211:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
211 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 212:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:212:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
212 |     if low > high {
    |                   ^
error: Expected expression at line 214:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:214:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
214 |     } else {
    |       ^
error: Expected Then at line 217:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:217:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
217 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 219:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:219:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
219 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:230:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
230 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 231:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:231:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
231 |     if low > high {
    |                   ^
error: Expected expression at line 233:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:233:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
233 |     } else {
    |       ^
error: Expected Then at line 236:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:236:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
236 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 238:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:238:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
238 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:249:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
249 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 250:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:250:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
250 |     if low > high {
    |                   ^
error: Expected expression at line 252:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:252:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
252 |     } else {
    |       ^
error: Expected Then at line 255:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:255:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
255 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 257:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:257:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
257 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:268:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
268 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 269:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:269:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
269 |     if low > high {
    |                   ^
error: Expected expression at line 271:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:271:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
271 |     } else {
    |       ^
error: Expected Then at line 274:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:274:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
274 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 276:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:276:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
276 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:287:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
287 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 288:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:288:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
288 |     if low > high {
    |                   ^
error: Expected expression at line 290:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:290:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
290 |     } else {
    |       ^
error: Expected Then at line 293:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:293:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
293 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 295:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:295:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
295 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:306:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
306 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 307:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:307:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
307 |     if low > high {
    |                   ^
error: Expected expression at line 309:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:309:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
309 |     } else {
    |       ^
error: Expected Then at line 312:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:312:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
312 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 314:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:314:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
314 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:325:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
325 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 326:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:326:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
326 |     if low > high {
    |                   ^
error: Expected expression at line 328:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:328:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
328 |     } else {
    |       ^
error: Expected Then at line 331:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:331:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
331 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 333:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:333:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
333 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:344:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
344 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 345:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:345:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
345 |     if low > high {
    |                   ^
error: Expected expression at line 347:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:347:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
347 |     } else {
    |       ^
error: Expected Then at line 350:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:350:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
350 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 352:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:352:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
352 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:363:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
363 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 364:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:364:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
364 |     if low > high {
    |                   ^
error: Expected expression at line 366:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:366:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
366 |     } else {
    |       ^
error: Expected Then at line 369:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:369:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
369 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 371:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:371:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
371 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:382:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
382 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 383:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:383:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
383 |     if low > high {
    |                   ^
error: Expected expression at line 385:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:385:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
385 |     } else {
    |       ^
error: Expected Then at line 388:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:388:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
388 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 390:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:390:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
390 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:401:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
401 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 402:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:402:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
402 |     if low > high {
    |                   ^
error: Expected expression at line 404:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:404:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
404 |     } else {
    |       ^
error: Expected Then at line 407:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:407:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
407 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 409:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:409:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
409 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:420:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
420 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 421:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:421:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
421 |     if low > high {
    |                   ^
error: Expected expression at line 423:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:423:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
423 |     } else {
    |       ^
error: Expected Then at line 426:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:426:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
426 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 428:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:428:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
428 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:439:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
439 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 440:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:440:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
440 |     if low > high {
    |                   ^
error: Expected expression at line 442:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:442:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
442 |     } else {
    |       ^
error: Expected Then at line 445:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:445:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
445 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 447:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:447:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
447 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:458:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
458 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 459:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:459:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
459 |     if low > high {
    |                   ^
error: Expected expression at line 461:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:461:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
461 |     } else {
    |       ^
error: Expected Then at line 464:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:464:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
464 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 466:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:466:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
466 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:477:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
477 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 478:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:478:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
478 |     if low > high {
    |                   ^
error: Expected expression at line 480:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:480:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
480 |     } else {
    |       ^
error: Expected Then at line 483:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:483:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
483 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 485:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:485:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
485 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:496:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
496 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 497:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:497:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
497 |     if low > high {
    |                   ^
error: Expected expression at line 499:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:499:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
499 |     } else {
    |       ^
error: Expected Then at line 502:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:502:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
502 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 504:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:504:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
504 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:515:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
515 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 516:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:516:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
516 |     if low > high {
    |                   ^
error: Expected expression at line 518:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:518:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
518 |     } else {
    |       ^
error: Expected Then at line 521:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:521:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
521 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 523:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:523:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
523 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:534:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
534 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 535:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:535:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
535 |     if low > high {
    |                   ^
error: Expected expression at line 537:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:537:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
537 |     } else {
    |       ^
error: Expected Then at line 540:28 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:540:28
  here: if mid_val == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
540 |       if mid_val == target {
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 542:9 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:542:9
  here: } else if mid_val < target {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
542 |       } else if mid_val < target {
    |         ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:553:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
    |
553 |   fn search(low: Int, high: Int) -> Option[Int] = {
    |   ^^
error: Expected Then at line 554:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:554:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
    |
554 |     if low > high {
    |                   ^
error: Expected expression at line 556:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:556:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
556 |     } else {
    |       ^
error: Expected Eq at line 558:18 (got Newline '')
  --> /tmp/dojo-binary-search-1.almd:558:18
  here: let mid_val
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
558 |       let mid_val
    |                  ^
error: Expected expression at line 560:1 (got Test 'test')
  --> /tmp/dojo-binary-search-1.almd:560:1
  here: test "binary_search empty" { assert_eq(binary_search([], 1), none) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
560 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
    | ^
error[E012]: duplicate function 'binary_search'
  at line 20
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
20 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^
error[E012]: duplicate function 'binary_search'
  at line 39
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
39 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^
error[E012]: duplicate function 'binary_search'
  at line 58
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
58 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^
error[E012]: duplicate function 'binary_search'
  at line 77
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
77 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^
error[E012]: duplicate function 'binary_search'
  at line 96
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
96 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^
error[E012]: duplicate function 'binary_search'
  at line 115
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
115 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 134
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
134 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 153
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
153 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 172
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
172 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 191
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
191 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 210
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
210 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 229
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
229 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 248
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
248 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 267
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
267 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 286
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
286 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 305
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
305 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 324
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
324 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 343
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
343 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 362
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
362 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 381
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
381 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 400
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
400 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 419
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
419 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 438
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
438 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 457
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
457 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 476
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
476 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 495
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
495 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 514
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
514 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 533
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
533 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E012]: duplicate function 'binary_search'
  at line 552
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ---------------------------------------- first definition of 'binary_search' here
 ...
552 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    | ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:6:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:6:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:25:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
25 |       let mid = (low + high) / 2
   |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:25:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
25 |       let mid = (low + high) / 2
   |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:44:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
44 |       let mid = (low + high) / 2
   |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:44:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
44 |       let mid = (low + high) / 2
   |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:63:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
63 |       let mid = (low + high) / 2
   |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:63:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
63 |       let mid = (low + high) / 2
   |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:82:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
82 |       let mid = (low + high) / 2
   |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:82:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
   |
82 |       let mid = (low + high) / 2
   |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:101:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
101 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:101:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
101 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:120:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
120 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:120:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
120 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:139:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
139 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:139:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
139 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:158:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
158 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:158:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
158 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:177:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
177 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:177:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
177 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:196:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
196 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:196:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
196 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:215:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
215 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:215:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
215 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:234:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
234 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:234:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
234 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:253:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
253 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:253:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
253 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:272:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
272 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:272:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
272 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:291:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
291 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:291:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
291 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:310:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
310 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:310:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
310 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:329:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
329 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:329:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
329 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:348:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
348 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:348:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
348 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:367:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
367 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:367:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
367 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:386:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
386 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:386:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
386 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:405:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
405 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:405:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
405 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:424:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
424 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:424:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
424 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:443:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
443 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:443:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
443 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:462:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
462 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:462:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
462 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:481:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
481 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:481:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
481 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:500:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
500 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:500:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
500 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:519:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
519 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:519:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
519 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:538:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
538 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:538:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
538 |       let mid = (low + high) / 2
    |                        ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:557:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
557 |       let mid = (low + high) / 2
    |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:557:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
    |
557 |       let mid = (low + high) / 2
    |                        ^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:7:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
7 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
  |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:26:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
26 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
   |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:45:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
45 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
   |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:64:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
64 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
   |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:83:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
83 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
   |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:102:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
102 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:121:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
121 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:140:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
140 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:159:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
159 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:178:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
178 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:197:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
197 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:216:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
216 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:235:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
235 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:254:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
254 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:273:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
273 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:292:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
292 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:311:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
311 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:330:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
330 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:349:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
349 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:368:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
368 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:387:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
387 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:406:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
406 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:425:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
425 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:444:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
444 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:463:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
463 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:482:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
482 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:501:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
501 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:520:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
520 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:539:34
  in fn 'binary_search'
  here: let mid_val = list.get(xs, mid).unwrap_or(-1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
539 |       let mid_val = list.get(xs, mid).unwrap_or(-1)
    |                                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:557:32
  in fn 'binary_search'
  here: let mid = (low + high) / 2
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
    |
557 |       let mid = (low + high) / 2
    |                                ^

269 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(none)
      match mid_val {
        some(x) => {
          if x == target {
            some(mid)
          } else if x < target {
            search(mid + 1, high)
          } else {
            search(low, mid - 1)
          }
        },
        none => {
          search(low, high)
        }
      }
    }
  }
  search(0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-2.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected expression at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error: Expected Then at line 10:26 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:10:26
  here: if x == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |           if x == target {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 14:13 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:14:13
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |           } else {
   |             ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:6:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:6:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                        ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:13:29
  in variable high
  here: search(mid + 1, high)
  hint: Check the variable name
   |
13 |             search(mid + 1, high)
   |                             ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?0]
  --> /tmp/dojo-binary-search-2.almd:7:34
  in call to option.unwrap_or()
  here: let mid_val = list.get(xs, mid).unwrap_or(none)
  hint: Fix the expression type or change the expected type
  |
7 |       let mid_val = list.get(xs, mid).unwrap_or(none)
  |                                  ^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-binary-search-2.almd:7:49
  in this expression with an unconstrained type
  here: let mid_val = list.get(xs, mid).unwrap_or(none)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
7 |       let mid_val = list.get(xs, mid).unwrap_or(none)
  |                                                 ^^^^

10 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(x) => {
          if x == target {
            some(mid)
          } else if x < target {
            search(mid + 1, high)
          } else {
            search(low, mid - 1)
          }
        },
        none => {
          search(low, high)
        }
      }
    }
  }
  search(0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-3.almd:2:3
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:3:19
  here: if low > high {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: Expected expression at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:5:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     } else {
  |       ^
error: Expected Then at line 10:26 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:10:26
  here: if x == target {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |           if x == target {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 14:13 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:14:13
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |           } else {
   |             ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:6:18
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:6:24
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
6 |       let mid = (low + high) / 2
  |                        ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:13:29
  in variable high
  here: search(mid + 1, high)
  hint: Check the variable name
   |
13 |             search(mid + 1, high)
   |                             ^^^^

8 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
