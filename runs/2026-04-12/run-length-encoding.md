# run-length-encoding

- **model**: `claude-sonnet-4-6`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd
error[E002]: undefined function 'list.head'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:2:19
  in call to list.head()
  hint: No function 'head' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   match list.head(chars) {
  |                   ^^^^^
error[E002]: undefined function 'list.tail'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:6:35
  in call to list.tail()
  hint: No function 'tail' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
6 |         rle_encode_loop(list.tail(chars), cur, count + 1, acc)
  |                                   ^^^^^
error[E002]: undefined function 'list.tail'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:8:35
  in call to list.tail()
  hint: No function 'tail' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
8 |         rle_encode_loop(list.tail(chars), h, 1, acc + int.to_string(count) + cur)
  |                                   ^^^^^
error[E002]: undefined function 'list.head'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:13:19
  in call to list.head()
  hint: No function 'head' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
13 |   match list.head(chars) {
   |                   ^^^^^
error[E002]: undefined function 'list.tail'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:15:42
  in call to list.tail()
  hint: No function 'tail' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |     some(h) => rle_encode_loop(list.tail(chars), h, 1, "")
   |                                          ^^^^^
error[E002]: undefined function 'list.head'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:24:19
  in call to list.head()
  hint: No function 'head' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
24 |   match list.head(chars) {
   |                   ^^^^^
error[E002]: undefined function 'list.tail'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:27:28
  in call to list.tail()
  hint: No function 'tail' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
27 |       let rest = list.tail(chars);
   |                            ^^^^^
error[E002]: undefined function 'list.head'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:28:23
  in call to list.head()
  hint: No function 'head' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
28 |       match list.head(rest) {
   |                       ^^^^
error[E002]: undefined function 'list.tail'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:32:37
  in call to list.tail()
  hint: No function 'tail' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
32 |           rle_decode_loop(list.tail(rest), acc + string_repeat(c, count))
   |                                     ^^^^

9 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn rle_encode_loop(chars: List[String], cur: String, count: Int, acc: String) -> String =
  match list.head(chars) {
    none => acc + int.to_string(count) + cur,
    some(h) =>
      if h == cur then
        rle_encode_loop(list.tail(chars), cur, count + 1, acc)
      else
        rle_encode_loop(list.tail(chars), h, 1, acc + int.to_string(count) + cur)
  }

fn rle_encode(s: String) -> String = {
  let chars = string.chars(s);
  match list.head(chars) {
    none => "",
    some(h) => rle_encode_loop(list.tail(chars), h, 1, "")
  }
}

fn string_repeat(s: String, n: Int) -> String =
  if n <= 0 then ""
  else s + string_repeat(s, n - 1)

fn rle_decode_loop(chars: List[String], acc: String) -> String =
  match list.head(chars) {
    none => acc,
    some(d) => {
      let rest = list.tail(chars);
      match list.head(rest) {
        none => acc,
        some(c) => {
          let count = match int.parse(d) { ok(n) => n, err(_) => 0 };
          rle_decode_loop(list.tail(rest), acc + string_repeat(c, count))
        }
      }
    }
  }

fn rle_decode(s: String) -> String =
  rle_decode_loop(string.chars(s), "")
```
