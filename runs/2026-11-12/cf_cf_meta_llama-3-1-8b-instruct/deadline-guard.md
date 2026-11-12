# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    compute(n * n + 1)
  } ?? 0
}

fn compute(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-0.almd
  test: deadline square small
  at:   /tmp/dojo-deadline-guard-0.almd:11
  expected: ok(17)
  found:    ok(290)
  test: deadline zero
  at:   /tmp/dojo-deadline-guard-0.almd:15
  expected: ok(1)
  found:    ok(2)
  test: deadline negative
  at:   /tmp/dojo-deadline-guard-0.almd:19
  expected: ok(10)
  found:    ok(101)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    compute(n)
  } ?? 0
}

fn compute(n: Int) -> Int = {
  let square = n * n
  square + 1
}
```
