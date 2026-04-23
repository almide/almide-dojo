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
        no_spaces_a = list.filter(string.chars(lower_a), (c) => c != " ")
        no_spaces_b = list.filter(string.chars(lower_b), (c) => c != " ")
        sorted_a = list.sort(no_spaces_a)
        sorted_b = list.sort(no_spaces_b)
    in 
    sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 9:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:9:5
  |
9 |     in
  |     ^
error[E003]: undefined variable 'lower_a'
  --> /tmp/dojo-anagram-check-0.almd:5:48
  in variable lower_a
  hint: Check the variable name
  |
5 |         no_spaces_a = list.filter(string.chars(lower_a), (c) => c != " ")
  |                                                ^^^^^^^
error[E003]: undefined variable 'lower_b'
  --> /tmp/dojo-anagram-check-0.almd:6:48
  in variable lower_b
  hint: Check the variable name
  |
6 |         no_spaces_b = list.filter(string.chars(lower_b), (c) => c != " ")
  |                                                ^^^^^^^
error[E003]: undefined variable 'no_spaces_a'
  --> /tmp/dojo-anagram-check-0.almd:7:30
  in variable no_spaces_a
  hint: Check the variable name
  |
7 |         sorted_a = list.sort(no_spaces_a)
  |                              ^^^^^^^^^^^
error[E003]: undefined variable 'no_spaces_b'
  --> /tmp/dojo-anagram-check-0.almd:8:30
  in variable no_spaces_b
  hint: Check the variable name
  |
8 |         sorted_b = list.sort(no_spaces_b)
  |                              ^^^^^^^^^^^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:10:5
  in variable sorted_a
  hint: Check the variable name
   |
10 |     sorted_a == sorted_b
   |     ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:10:17
  in variable sorted_b
  hint: Check the variable name
   |
10 |     sorted_a == sorted_b
   |                 ^^^^^^^^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    string.to_lower(a) |> (lower_a) => 
    string.to_lower(b) |> (lower_b) => 
    list.filter(string.chars(lower_a), (c) => c != " ") |> (no_spaces_a) => 
    list.filter(string.chars(lower_b), (c) => c != " ") |> (no_spaces_b) => 
    list.sort(no_spaces_a) |> (sorted_a) => 
    list.sort(no_spaces_b) |> (sorted_b) => 
    sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:358:9
    |
358 | /         move |lower_a| {
359 | |             let __cap_2: String = lower_a;
360 | |             move |lower_b| {
361 | |                 let __cap_3: String = lower_b;
...   |
378 | |             }).collect::<Vec<_>>())
379 | |         }(almide_rt_string_to_lower(&*__cap_1))
    | |_______________________________________________^ expected `()`, found closure
    |
    = note: expected unit type `()`
                 found closure `{closure@<generated.rs>:358:9: 358:23}`


error[E0308]: mismatched types
   --> <generated.rs>:380:6
    |
355 | pub fn is_anagram(a: String, b: String) -> bool {
    |                                            ---- expected `bool` because of return type
...
380 |     }(almide_rt_string_to_lower(&*a))
    |      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `bool`, found `String`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors

FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let lower_a = string.to_lower(a)
    let lower_b = string.to_lower(b)
    let no_spaces_a = list.filter(string.chars(lower_a), (c) => c != " ")
    let no_spaces_b = list.filter(string.chars(lower_b), (c) => c != " ")
    let sorted_a = list.sort(no_spaces_a)
    let sorted_b = list.sort(no_spaces_b)
    sorted_a == sorted_b
```
