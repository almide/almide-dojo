# run-length-encoding

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String =
  string.run_length_encode(s)
    |> list.map((pair) => int.to_string(pair.1) + pair.0)
    |> string.join("")

fn rle_decode_step(chars: List[String], acc: String) -> String =
  if list.len(chars) < 2 then acc
  else
    let count = list.get(chars, 0)
      |> option.unwrap_or("0")
      |> int.parse
      |> result.unwrap_or(0)
    let ch = list.get_or(chars, 1, "")
    rle_decode_step(list.drop(chars, 2), acc + string.repeat(ch, count))

fn rle_decode(s: String) -> String =
  rle_decode_step(string.chars(s), "")
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-run-length-encoding-0.almd:9:5
  in let-in
  here: let count = list.get(chars, 0)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let count = list.get(chars, 0)
  |     ^^^

1 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-run-length-encoding-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-run-length-encoding-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn rle_encode(s: String) -> String =
  string.run_length_encode(s)
    |> list.map((pair) => int.to_string(pair.1) + pair.0)
    |> string.join("")

fn rle_decode_step(chars: List[String], acc: String) -> String =
  if list.len(chars) < 2 then acc
  else {
    let count = list.get_or(chars, 0, "0") |> int.parse |> result.unwrap_or(0)
    let ch = list.get_or(chars, 1, "")
    rle_decode_step(list.drop(chars, 2), acc + string.repeat(ch, count))
  }

fn rle_decode(s: String) -> String =
  rle_decode_step(string.chars(s), "")
```
