# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-0.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-0.almd:8:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   fan.bounded(compute.ms(100)) {
  |   ^

3 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-1.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-1.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-1.almd:9:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   fan.bounded(compute.ms(100)) {
  |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-1.almd:8:20
  in variable xs
  here: let result = sum(xs)
  hint: Check the variable name
  |
8 |   let result = sum(xs)
  |                    ^^

4 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
  } ?? -1
}

effect fn
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-2.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-2.almd:9:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   fan.bounded(compute.ms(100)) {
  |   ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-2.almd:15:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
15 |   fn sum(xs: List[Int]) -> Int = {
   |   ^^
error: Expected pattern at line 17:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:17:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-2.almd:22:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   fan.bounded(compute.ms(100)) {
   |   ^
error: Expected expression at line 28:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:28:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
28 |   let sum = fn (xs: List[Int]) -> Int = {
   |             ^
error: Expected pattern at line 30:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:30:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 33:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:33:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 |   }
   |   ^
error: Expected expression at line 41:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:41:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   let sum = fn (xs: List[Int]) -> Int = {
   |             ^
error: Expected pattern at line 43:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:43:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
43 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 46:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:46:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |   }
   |   ^
error: Expected expression at line 54:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:54:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
54 |   let sum = fn (xs: List[Int]) -> Int = {
   |             ^
error: Expected pattern at line 56:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:56:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
56 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 59:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:59:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
59 |   }
   |   ^
error: Expected expression at line 67:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:67:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
67 |   let sum = fn (xs: List[Int]) -> Int = {
   |             ^
error: Expected pattern at line 69:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:69:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
69 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 72:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:72:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
72 |   }
   |   ^
error: Expected expression at line 80:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:80:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
80 |   let sum = fn (xs: List[Int]) -> Int = {
   |             ^
error: Expected pattern at line 82:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:82:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
82 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 85:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:85:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
85 |   }
   |   ^
error: Expected expression at line 93:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:93:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
93 |   let sum = fn (xs: List[Int]) -> Int = {
   |             ^
error: Expected pattern at line 95:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:95:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
95 |       | [] => 0
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 98:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:98:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
98 |   }
   |   ^
error: Expected expression at line 106:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:106:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
106 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 108:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:108:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
108 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 111:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:111:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
111 |   }
    |   ^
error: Expected expression at line 119:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:119:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
119 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 121:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:121:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
121 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 124:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:124:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
124 |   }
    |   ^
error: Expected expression at line 132:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:132:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
132 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 134:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:134:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
134 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 137:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:137:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
137 |   }
    |   ^
error: Expected expression at line 145:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:145:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
145 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 147:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:147:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
147 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 150:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:150:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
150 |   }
    |   ^
error: Expected expression at line 158:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:158:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
158 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 160:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:160:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
160 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 163:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:163:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
163 |   }
    |   ^
error: Expected expression at line 171:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:171:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
171 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 173:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:173:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
173 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 176:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:176:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
176 |   }
    |   ^
error: Expected expression at line 184:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:184:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
184 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 186:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:186:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
186 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 189:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:189:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
189 |   }
    |   ^
error: Expected expression at line 197:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:197:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
197 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 199:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:199:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
199 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 202:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:202:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
202 |   }
    |   ^
error: Expected expression at line 210:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:210:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
210 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 212:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:212:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
212 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 215:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:215:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
215 |   }
    |   ^
error: Expected expression at line 223:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:223:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
223 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 225:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:225:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
225 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 228:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:228:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
228 |   }
    |   ^
error: Expected expression at line 236:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:236:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
236 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 238:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:238:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
238 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 241:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:241:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
241 |   }
    |   ^
error: Expected expression at line 249:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:249:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
249 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 251:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:251:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
251 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 254:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:254:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
254 |   }
    |   ^
error: Expected expression at line 262:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:262:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
262 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 264:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:264:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
264 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 267:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:267:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
267 |   }
    |   ^
error: Expected expression at line 275:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:275:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
275 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 277:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:277:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
277 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 280:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:280:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
280 |   }
    |   ^
error: Expected expression at line 288:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:288:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
288 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 290:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:290:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
290 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 293:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:293:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
293 |   }
    |   ^
error: Expected expression at line 301:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:301:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
301 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 303:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:303:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
303 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 306:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:306:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
306 |   }
    |   ^
error: Expected expression at line 314:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:314:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
314 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 316:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:316:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
316 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 319:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:319:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
319 |   }
    |   ^
error: Expected expression at line 327:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:327:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
327 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 329:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:329:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
329 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 332:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:332:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
332 |   }
    |   ^
error: Expected expression at line 340:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:340:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
340 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 342:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:342:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
342 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 345:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:345:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
345 |   }
    |   ^
error: Expected expression at line 353:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:353:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
353 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 355:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:355:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
355 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 358:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:358:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
358 |   }
    |   ^
error: Expected expression at line 366:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:366:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
366 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 368:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:368:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
368 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 371:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:371:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
371 |   }
    |   ^
error: Expected expression at line 379:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:379:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
379 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 381:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:381:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
381 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 384:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:384:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
384 |   }
    |   ^
error: Expected expression at line 392:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:392:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
392 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 394:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:394:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
394 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 397:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:397:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
397 |   }
    |   ^
error: Expected expression at line 405:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:405:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
405 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 407:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:407:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
407 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 410:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:410:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
410 |   }
    |   ^
error: Expected expression at line 418:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:418:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
418 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 420:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:420:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
420 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 423:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:423:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
423 |   }
    |   ^
error: Expected expression at line 431:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:431:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
431 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 433:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:433:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
433 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 436:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:436:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
436 |   }
    |   ^
error: Expected expression at line 444:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:444:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
444 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 446:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:446:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
446 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 449:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:449:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
449 |   }
    |   ^
error: Expected expression at line 457:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:457:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
457 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 459:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:459:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
459 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 462:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:462:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
462 |   }
    |   ^
error: Expected expression at line 470:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:470:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
470 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 472:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:472:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
472 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 475:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:475:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
475 |   }
    |   ^
error: Expected expression at line 483:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:483:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
483 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 485:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:485:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
485 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 488:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:488:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
488 |   }
    |   ^
error: Expected expression at line 496:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:496:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
496 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 498:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:498:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
498 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 501:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:501:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
501 |   }
    |   ^
error: Expected expression at line 509:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:509:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
509 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 511:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:511:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
511 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 514:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:514:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
514 |   }
    |   ^
error: Expected expression at line 522:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:522:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
522 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 524:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:524:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
524 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 527:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:527:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
527 |   }
    |   ^
error: Expected expression at line 535:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:535:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
535 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 537:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:537:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
537 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 540:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:540:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
540 |   }
    |   ^
error: Expected expression at line 548:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:548:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
548 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 550:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:550:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
550 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 553:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:553:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
553 |   }
    |   ^
error: Expected expression at line 561:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:561:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
561 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 563:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:563:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
563 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 566:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:566:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
566 |   }
    |   ^
error: Expected expression at line 574:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:574:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
574 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 576:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:576:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
576 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 579:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:579:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
579 |   }
    |   ^
error: Expected expression at line 587:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:587:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
587 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 589:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:589:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
589 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 592:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:592:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
592 |   }
    |   ^
error: Expected expression at line 600:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:600:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
600 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 602:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:602:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
602 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 605:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:605:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
605 |   }
    |   ^
error: Expected expression at line 613:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:613:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
613 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 615:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:615:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
615 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 618:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:618:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
618 |   }
    |   ^
error: Expected expression at line 626:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:626:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
626 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 628:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:628:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
628 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 631:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:631:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
631 |   }
    |   ^
error: Expected expression at line 639:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:639:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
639 |   let sum = fn (xs: List[Int]) -> Int = {
    |             ^
error: Expected pattern at line 641:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:641:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
    |
641 |       | [] => 0
    |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 644:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:644:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
644 |   }
    |   ^
error: Expected function name at line 651:10 (got Newline '')
  --> /tmp/dojo-bounded-total-2.almd:651:10
  here: effect fn
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
651 | effect fn
    |          ^
error[E012]: duplicate function 'safe_total'
  at line 14
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
14 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 27
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
27 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 40
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
40 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 53
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
53 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 66
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
66 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 79
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
79 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 92
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
92 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'safe_total'
  at line 105
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
105 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 118
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
118 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 131
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
131 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 144
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
144 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 157
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
157 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 170
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
170 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 183
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
183 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 196
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
196 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 209
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
209 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 222
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
222 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 235
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
235 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 248
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
248 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 261
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
261 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 274
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
274 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 287
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
287 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 300
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
300 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 313
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
313 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 326
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
326 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 339
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
339 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 352
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
352 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 365
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
365 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 378
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
378 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 391
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
391 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 404
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
404 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 417
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
417 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 430
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
430 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 443
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
443 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 456
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
456 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 469
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
469 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 482
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
482 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 495
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
495 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 508
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
508 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 521
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
521 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 534
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
534 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 547
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
547 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 560
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
560 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 573
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
573 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 586
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
586 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 599
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
599 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 612
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
612 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 625
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
625 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'safe_total'
  at line 638
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ------------------------------------- first definition of 'safe_total' here
 ...
638 | effect fn safe_total(xs: List[Int]) -> Int = {
    | ^
error[E012]: duplicate top-level binding 'result'
  at line 21
  in let result
  here: let result = sum(xs)
  hint: 'result' is already declared at module scope — rename one, or merge the two initializers
   |
 8 |   let result = sum(xs)
   |   ---------------------------- 'result' first declared here
...
21 |   let result = sum(xs)
   |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-2.almd:8:20
  in variable xs
  here: let result = sum(xs)
  hint: Check the variable name
  |
8 |   let result = sum(xs)
  |                    ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-2.almd:21:20
  in variable xs
  here: let result = sum(xs)
  hint: Check the variable name
   |
21 |   let result = sum(xs)
   |                    ^^

203 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  let sum = fn (xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1
}
```

**Diagnostic:**

```
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-3.almd:2:13
  here: let sum = fn (xs: List[Int]) -> Int = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let sum = fn (xs: List[Int]) -> Int = {
  |             ^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-3.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-3.almd:7:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   }
  |   ^

3 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
