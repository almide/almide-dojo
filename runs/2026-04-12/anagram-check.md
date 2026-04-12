# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-anagram-check-3.almd:3:3
  |
3 |   in clean(string.to_lower(a)) == clean(string.to_lower(b))
  |   ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-3.almd:2:89
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (s: String) => list.sort(list.filter(string.chars(s), (c: String) => c != " "))
  |                                                                                         ^^^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (s: String) => list.sort(list.filter(string.chars(s), (c: String) => c != " "))
  in clean(string.to_lower(a)) == clean(string.to_lower(b))
```
