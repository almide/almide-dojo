# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0282`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    clean = (s) => string.chars(s) |> list.filter((c) => c != " ")
    sorted_chars = (s) => clean(string.to_lower(s)) |> list.sort
  in
    sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:5:3
  |
5 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:49
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_chars = (s) => clean(string.to_lower(s)) |> list.sort
  |                                                 ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:18
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |     sorted_chars(a) == sorted_chars(b)
  |                  ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:37
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |     sorted_chars(a) == sorted_chars(b)
  |                                     ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (s) => string.chars(s) |> list.filter((c) => c != " ")
  let sorted_chars = (s) => clean(string.to_lower(s)) |> list.sort
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0282]: type annotations needed
   --> <generated.rs>:362:15
    |
362 |         move |s| almide_rt_list_sort(&__cap_4.clone()(almide_rt_string_to_lower(&*s)))
    |               ^                                                                  -- type must be known at this point
    |
help: consider giving this closure parameter an explicit type
    |
362 |         move |s: /* Type */| almide_rt_list_sort(&__cap_4.clone()(almide_rt_string_to_lower(&*s)))
    |                ++++++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error

FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (s: String) => string.chars(s) |> list.filter((c: String) => c != " ")
  let sorted_chars = (s: String) => clean(string.to_lower(s)) |> list.sort
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
Compile error for /tmp/dojo-anagram-check-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0282]: type annotations needed
   --> <generated.rs>:362:15
    |
362 |         move |s| almide_rt_list_sort(&__cap_4.clone()(almide_rt_string_to_lower(&*s)))
    |               ^                                                                  -- type must be known at this point
    |
help: consider giving this closure parameter an explicit type
    |
362 |         move |s: /* Type */| almide_rt_list_sort(&__cap_4.clone()(almide_rt_string_to_lower(&*s)))
    |                ++++++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error

FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (s: String) => string.chars(s) |> list.filter((c: String) => c != " ")
  let sorted_chars = (s: String) => clean(string.to_lower(s)) |> list.sort
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
Compile error for /tmp/dojo-anagram-check-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0282]: type annotations needed
   --> <generated.rs>:362:15
    |
362 |         move |s| almide_rt_list_sort(&__cap_4.clone()(almide_rt_string_to_lower(&*s)))
    |               ^                                                                  -- type must be known at this point
    |
help: consider giving this closure parameter an explicit type
    |
362 |         move |s: /* Type */| almide_rt_list_sort(&__cap_4.clone()(almide_rt_string_to_lower(&*s)))
    |                ++++++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error

FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
