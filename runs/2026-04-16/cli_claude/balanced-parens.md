# balanced-parens

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_open(ch: String) -> Bool =
  list.contains(["(", "[", "{"], ch)

fn is_close(ch: String) -> Bool =
  list.contains([")", "]", "}"], ch)

fn pair_matches(open: String, close: String) -> Bool =
  match (open, close) {
    ("(", ")") => true,
    ("[", "]") => true,
    ("{", "}") => true,
    _ => false
  }

fn step(acc: Option[List[String]], ch: String) -> Option[List[String]] =
  match acc {
    none => none,
    some(stack) =>
      if is_open(ch) then
        some(stack + [ch])
      else if is_close(ch) then
        match list.last(stack) {
          none => none,
          some(top) =>
            if pair_matches(top, ch) then
              some(list.drop_end(stack, 1))
            else
              none
        }
      else
        some(stack)
  }

fn is_balanced(s: String) -> Bool =
  match list.fold(string.chars(s), some([]), step) {
    none => false,
    some(stack) => list.is_empty(stack)
  }
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:345:10
    |
344 |     match (open, close) {
    |           ------------- this expression has type `(String, String)`
345 |         ("(", ")") => true,
    |          ^^^ expected `String`, found `&str`


error[E0308]: mismatched types
   --> <generated.rs>:345:15
    |
344 |     match (open, close) {
    |           ------------- this expression has type `(String, String)`
345 |         ("(", ")") => true,
    |               ^^^ expected `String`, found `&str`


error[E0308]: mismatched types
   --> <generated.rs>:346:10
    |
344 |     match (open, close) {
    |           ------------- this expression has type `(String, String)`
345 |         ("(", ")") => true,
346 |         ("[", "]") => true,
    |          ^^^ expected `String`, found `&str`


error[E0308]: mismatched types
   --> <generated.rs>:346:15
    |
344 |     match (open, close) {
    |           ------------- this expression has type `(String, String)`
345 |         ("(", ")") => true,
346 |         ("[", "]") => true,
    |               ^^^ expected `String`, found `&str`


error[E0308]: mismatched types
   --> <generated.rs>:347:10
    |
344 |     match (open, close) {
    |           ------------- this expression has type `(String, String)`
...
347 |         ("{", "}") => true,
    |          ^^^ expected `String`, found `&str`


error[E0308]: mismatched types
   --> <generated.rs>:347:15
    |
344 |     match (open, close) {
    |           ------------- this expression has type `(String, String)`
...
347 |         ("{", "}") => true,
    |               ^^^ expected `String`, found `&str`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 2 warnings emitted

FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_open(ch: String) -> Bool =
  list.contains(["(", "[", "{"], ch)

fn is_close(ch: String) -> Bool =
  list.contains([")", "]", "}"], ch)

fn pair_matches(open: String, close: String) -> Bool =
  if open == "(" then close == ")"
  else if open == "[" then close == "]"
  else if open == "{" then close == "}"
  else false

fn step(acc: Option[List[String]], ch: String) -> Option[List[String]] =
  match acc {
    none => none,
    some(stack) =>
      if is_open(ch) then
        some(stack + [ch])
      else if is_close(ch) then
        match list.last(stack) {
          none => none,
          some(top) =>
            if pair_matches(top, ch) then
              some(list.drop_end(stack, 1))
            else
              none
        }
      else
        some(stack)
  }

fn is_balanced(s: String) -> Bool =
  match list.fold(string.chars(s), some([]), step) {
    none => false,
    some(stack) => list.is_empty(stack)
  }
```
