# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(string.drop(s, 1) + [string.last(s)])
}
```

**Diagnostic:**

```
internal compiler error: IR verify: ConcatStr expects String operands, got String and List[Option[String]] (in is_palindrome) at line 5
FAILED: /tmp/dojo-is-palindrome-0.almd
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(string.drop(s, 1) + [string.last(s)])
}
```

**Diagnostic:**

```
internal compiler error: IR verify: ConcatStr expects String operands, got String and List[Option[String]] (in is_palindrome) at line 5
FAILED: /tmp/dojo-is-palindrome-1.almd
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(string.drop(s, 1) + [string.get(s, len - 1)])
}
```

**Diagnostic:**

```
internal compiler error: IR verify: ConcatStr expects String operands, got String and List[Option[String]] (in is_palindrome) at line 5
FAILED: /tmp/dojo-is-palindrome-2.almd
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let len = string.len(s)
  if len <= 1 then true
  else if string.first(s) != string.last(s) then false
  else is_palindrome(list.drop(list.enumerate(string.chars(s)), len - 1).map(fn (x) => x.1).reverse())
}
```

**Diagnostic:**

```
error: Expected expression at line 5:78 (got Fn 'fn')
  --> /tmp/dojo-is-palindrome-3.almd:5:78
  here: else is_palindrome(list.drop(list.enumerate(string.chars(s)), len - 1).map(fn (x) => x.1).reverse())
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   else is_palindrome(list.drop(list.enumerate(string.chars(s)), len - 1).map(fn (x) => x.1).reverse())
  |                                                                              ^
error[E001]: type mismatch in fn 'is_palindrome': expected Bool but got Unit
  --> /tmp/dojo-is-palindrome-3.almd:2:24
  in fn 'is_palindrome'
  here: let len = string.len(s)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let len = string.len(s)
  |                        ^

2 error(s) found
FAILED: /tmp/dojo-is-palindrome-3.almd
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
