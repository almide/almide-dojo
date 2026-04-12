# remove-duplicates

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-remove-duplicates-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:6 (got Match 'match')
  --> /tmp/dojo-remove-duplicates-3.almd:2:6
  |
2 |   xs match {
  |      ^

1 error(s) found
Compile error for /tmp/dojo-remove-duplicates-3.almd:
compile failed
FAILED: /tmp/dojo-remove-duplicates-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  xs match {
    case Nil => Nil
    case x :: xs1 => 
      if xs1.contains(x) then 
        remove_duplicates(xs1)
      else 
        x :: remove_duplicates(xs1)
  }
```
