fn remove_duplicates(xs: &[i64]) -> Vec<i64> {
    let mut out = Vec::new();
    for &x in xs {
        if !out.contains(&x) {
            out.push(x);
        }
    }
    out
}
