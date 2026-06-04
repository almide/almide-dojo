# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.run_length_encode(s) in
  let mapped = list.map(encoded, (x) => int.to_string(x.1) + x.0) in
  string.join(mapped, "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then 
    ""
  else 
    let chars = string.chars(s) in
    let pairs = list.chunk(chars, 2) in
    let decoded = list.map(pairs, (pair) => 
      let count = int.parse(list.first(pair) |> option.unwrap_or("")) in
      let char = list.last(pair) |> option.unwrap_or("") in
      string.repeat(char, count |> result.unwrap_or(1))
    ) in
    string.join(decoded, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-run-length-encoding-0.almd:10:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |     let chars = string.chars(s) in
   |     ^^^

1 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn rle_encode(s: String) -> String = 
  let encoded = string.run_length_encode(s) in
  let mapped = list.map(encoded, (x) => int.to_string(x.1) + x.0) in
  string.join(mapped, "")

fn rle_decode(s: String) -> String = 
  if string.is_empty(s) then 
    ""
  else 
    string.join(
      list.map(
        list.chunk(string.chars(s), 2), 
        (pair) => 
          string.repeat(
            list.last(pair) |> option.unwrap_or(""),
            int.parse(list.first(pair) |> option.unwrap_or("")) |> result.unwrap_or(1)
          )
      ), 
      ""
    )
```
