# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        lower_a = string.to_lower(a)
        lower_b = string.to_lower(b)
        chars_a = string.chars(lower_a) |> list.filter((x) => x != " ")
        chars_b = string.chars(lower_b) |> list.filter((x) => x != " ")
    in 
        list.sort(chars_a) == list.sort(chars_b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 7:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:7:5
  |
7 |     in
  |     ^
error[E003]: undefined variable 'lower_a'
  --> /tmp/dojo-anagram-check-0.almd:5:32
  in variable lower_a
  hint: Check the variable name
  |
5 |         chars_a = string.chars(lower_a) |> list.filter((x) => x != " ")
  |                                ^^^^^^^
error[E003]: undefined variable 'lower_b'
  --> /tmp/dojo-anagram-check-0.almd:6:32
  in variable lower_b
  hint: Check the variable name
  |
6 |         chars_b = string.chars(lower_b) |> list.filter((x) => x != " ")
  |                                ^^^^^^^
error[E003]: undefined variable 'chars_a'
  --> /tmp/dojo-anagram-check-0.almd:8:19
  in variable chars_a
  hint: Check the variable name
  |
8 |         list.sort(chars_a) == list.sort(chars_b)
  |                   ^^^^^^^
error[E003]: undefined variable 'chars_b'
  --> /tmp/dojo-anagram-check-0.almd:8:41
  in variable chars_b
  hint: Check the variable name
  |
8 |         list.sort(chars_a) == list.sort(chars_b)
  |                                         ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    string.to_lower(a) 
    |> (x) => string.chars(x) 
    |> (x) => list.filter(x, (y) => y != " ") 
    |> (x) => list.sort(x) 
    == string.to_lower(b) 
    |> (x) => string.chars(x) 
    |> (x) => list.filter(x, (y) => y != " ") 
    |> (x) => list.sort(x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0282]: type annotations needed
   --> <generated.rs>:360:19
    |
360 |             move |x| {
    |                   ^
...
366 |             }((x).into_iter().filter(move |y| {
    |               --- type must be known at this point
    |
help: consider giving this closure parameter an explicit type
    |
360 |             move |x: /* Type */| {
    |                    ++++++++++++


error[E0308]: mismatched types
   --> <generated.rs>:371:6
    |
355 | pub fn is_anagram(a: String, b: String) -> bool {
    |                                            ---- expected `bool` because of return type
...
371 |     }(almide_rt_string_to_lower(&*a))
    |      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `bool`, found `String`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors

FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    list.sort(
        list.filter(
            string.chars(string.to_lower(a)), 
            (y) => y != " "
        )
    ) 
    == 
    list.sort(
        list.filter(
            string.chars(string.to_lower(b)), 
            (y) => y != " "
        )
    )
```
