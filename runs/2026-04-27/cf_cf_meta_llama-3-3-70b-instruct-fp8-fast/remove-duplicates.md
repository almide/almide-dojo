# remove-duplicates

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.fold(
    xs, 
    set.new[Int](), 
    (acc, x) => 
      if set.contains(acc, x) then acc 
      else set.insert(acc, x)
  ) 
  |> set.to_list
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-0.almd
FAILED: /tmp/dojo-remove-duplicates-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.fold(
    xs, 
    set.new[Int](), 
    (acc, x) => 
      if set.contains(acc, x) then acc 
      else set.insert(acc, x)
  ) 
  |> set.to_list 
  |> list.sort_by((x) => list.index_of(xs, x).unwrap_or(0))
```
