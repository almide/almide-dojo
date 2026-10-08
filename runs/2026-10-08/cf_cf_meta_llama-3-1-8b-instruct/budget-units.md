# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: runtime-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
[POSTCONDITION VIOLATION] [ConcretizeTypes] 1 expression(s) remain with unresolved types. Samples: [fn run_with_budget:4:6] unresolved Call ty=Unknown (call)

thread '<unnamed>' (3021) panicked at crates/almide-codegen/src/pass.rs:445:13:
Postcondition violation after pass 'ConcretizeTypes'
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
the compiler panicked (this is an Almide bug): Postcondition violation after pass 'ConcretizeTypes'

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
[POSTCONDITION VIOLATION] [ConcretizeTypes] 1 expression(s) remain with unresolved types. Samples: [fn run_with_budget:4:6] unresolved Call ty=Unknown (call)

thread '<unnamed>' (3032) panicked at crates/almide-codegen/src/pass.rs:445:13:
Postcondition violation after pass 'ConcretizeTypes'
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
the compiler panicked (this is an Almide bug): Postcondition violation after pass 'ConcretizeTypes'

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
[POSTCONDITION VIOLATION] [ConcretizeTypes] 1 expression(s) remain with unresolved types. Samples: [fn run_with_budget:4:6] unresolved Call ty=Unknown (call)

thread '<unnamed>' (3042) panicked at crates/almide-codegen/src/pass.rs:445:13:
Postcondition violation after pass 'ConcretizeTypes'
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
the compiler panicked (this is an Almide bug): Postcondition violation after pass 'ConcretizeTypes'

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
[POSTCONDITION VIOLATION] [ConcretizeTypes] 1 expression(s) remain with unresolved types. Samples: [fn run_with_budget:4:6] unresolved Call ty=Unknown (call)

thread '<unnamed>' (3052) panicked at crates/almide-codegen/src/pass.rs:445:13:
Postcondition violation after pass 'ConcretizeTypes'
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
the compiler panicked (this is an Almide bug): Postcondition violation after pass 'ConcretizeTypes'

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
