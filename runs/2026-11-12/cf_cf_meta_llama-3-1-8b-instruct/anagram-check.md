# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == list.sort(string.to_list(string.to_lower(b)))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-anagram-check-0.almd
  test: anagram with spaces
  at:   /tmp/dojo-anagram-check-0.almd:7
  expected: true
  found:    false

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == list.sort(string.to_list(string.to_lower(b)))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-anagram-check-1.almd
  test: anagram with spaces
  at:   /tmp/dojo-anagram-check-1.almd:7
  expected: true
  found:    false

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == list.sort(string.to_list(string.to_lower(b)))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-anagram-check-2.almd
  test: anagram with spaces
  at:   /tmp/dojo-anagram-check-2.almd:7
  expected: true
  found:    false

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == list.sort(string.to_list(string.to_lower(b)))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-anagram-check-3.almd
  test: anagram with spaces
  at:   /tmp/dojo-anagram-check-3.almd:7
  expected: true
  found:    false

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
