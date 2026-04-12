# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn to_roman(n: Int) -> String = {
    let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    var num = n
    var result = ""
    for i in 0..values.length {
        while num >= values[i] {
            result = result + symbols[i]
            num = num - values[i]
        }
    }
    result
}
```
