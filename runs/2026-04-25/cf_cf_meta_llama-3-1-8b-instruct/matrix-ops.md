# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
## Matrix Operations

### mat_add

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] {
    let (nrows, ncols) = (list.len(a), list.len(list.first(a).unwrap_or([])));
    list.map(a, |row_a| {
        list.map(row_a, |val_a| {
            list.get(b, list.index_of(list.first(b).unwrap_or([]), val_a)).unwrap_or(0)
        })
    })
}

### mat_transpose

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] {
    if list.is_empty(m) {
        return list.new();
    }
    let ncols = list.len(list.first(m).unwrap_or([]));
    list.range(0, ncols).map(|col_idx| {
        list.map(m, |row| {
            list.get(row, col_idx).unwrap_or(0)
        })
    })
}

### mat_scale

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] {
    list.map(m, |row| {
        list.map(row, |val| val * s)
    })
}
```
