# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
    let words = string.split(s, " ");
    let capitalized = words.map((word) => string.capitalize(word));
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-title-case-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn title_case(...) -> Type = { ... }
  |
1 | fn title_case(s: String) -> String {
  |                                    ^

1 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ");
    let capitalized = words.map((word) => string.capitalize(word));
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ");
    let capitalized = words.map((word) => string.capitalize(word)).to_list();
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error[E002]: undefined method 'to_list' on list
  --> /tmp/dojo-title-case-2.almd:3:23
  in method call .to_list()
  hint: Almide doesn't use method-call syntax. Write `list.<fn>(x)` (or `x |> list.<fn>`) — there is no method `to_list` on `list`. Run `almide explain E002` for examples.
  |
3 |     let capitalized = words.map((word) => string.capitalize(word)).to_list();
  |                       ^^^^^

1 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ");
    let capitalized = words.map((word) => string.capitalize(word));
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
