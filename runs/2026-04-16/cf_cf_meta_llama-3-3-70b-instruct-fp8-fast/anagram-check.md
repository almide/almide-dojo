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
    a_lower = string.to_lower(a)
    b_lower = string.to_lower(b)
    a_chars = list.filter(string.chars(a_lower), (x) => x != " ")
    b_chars = list.filter(string.chars(b_lower), (x) => x != " ")
    a_sorted = list.sort(a_chars)
    b_sorted = list.sort(b_chars)
  in 
    a_sorted == b_sorted
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 9:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:9:3
  |
9 |   in
  |   ^
error[E003]: undefined variable 'a_lower'
  --> /tmp/dojo-anagram-check-0.almd:5:40
  in variable a_lower
  hint: Check the variable name
  |
5 |     a_chars = list.filter(string.chars(a_lower), (x) => x != " ")
  |                                        ^^^^^^^
error[E003]: undefined variable 'b_lower'
  --> /tmp/dojo-anagram-check-0.almd:6:40
  in variable b_lower
  hint: Check the variable name
  |
6 |     b_chars = list.filter(string.chars(b_lower), (x) => x != " ")
  |                                        ^^^^^^^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-0.almd:7:26
  in variable a_chars
  hint: Check the variable name
  |
7 |     a_sorted = list.sort(a_chars)
  |                          ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-0.almd:8:26
  in variable b_chars
  hint: Check the variable name
  |
8 |     b_sorted = list.sort(b_chars)
  |                          ^^^^^^^
error[E003]: undefined variable 'a_sorted'
  --> /tmp/dojo-anagram-check-0.almd:10:5
  in variable a_sorted
  hint: Check the variable name
   |
10 |     a_sorted == b_sorted
   |     ^^^^^^^^
error[E003]: undefined variable 'b_sorted'
  --> /tmp/dojo-anagram-check-0.almd:10:17
  in variable b_sorted
  hint: Check the variable name
   |
10 |     a_sorted == b_sorted
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
  list.filter(string.chars(lower_a), (x) => x != " ") |> (a_chars) => 
  list.filter(string.chars(lower_b), (x) => x != " ") |> (b_chars) => 
  list.sort(a_chars) == list.sort(b_chars)
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
372 | |             }).collect::<Vec<_>>())
373 | |         }(almide_rt_string_to_lower(&*__cap_1))
    | |_______________________________________________^ expected `()`, found closure
    |
    = note: expected unit type `()`
                 found closure `{closure@<generated.rs>:358:9: 358:23}`


error[E0308]: mismatched types
   --> <generated.rs>:374:6
    |
355 | pub fn is_anagram(a: String, b: String) -> bool {
    |                                            ---- expected `bool` because of return type
...
374 |     }(almide_rt_string_to_lower(&*a))
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
  let a_chars = list.filter(string.chars(lower_a), (x) => x != " ")
  let b_chars = list.filter(string.chars(lower_b), (x) => x != " ")
  list.sort(a_chars) == list.sort(b_chars)
```
