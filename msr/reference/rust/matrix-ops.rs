fn mat_add(a: &[Vec<i64>], b: &[Vec<i64>]) -> Vec<Vec<i64>> {
    a.iter()
        .zip(b)
        .map(|(ra, rb)| ra.iter().zip(rb).map(|(x, y)| x + y).collect())
        .collect()
}

fn mat_transpose(m: &[Vec<i64>]) -> Vec<Vec<i64>> {
    let ncols = m.first().map_or(0, |r| r.len());
    (0..ncols).map(|j| m.iter().map(|row| row[j]).collect()).collect()
}

fn mat_scale(m: &[Vec<i64>], s: i64) -> Vec<Vec<i64>> {
    m.iter().map(|row| row.iter().map(|x| x * s).collect()).collect()
}

fn mat_dot_row(row_a: &[i64], col_b: &[i64]) -> i64 {
    row_a.iter().zip(col_b).map(|(x, y)| x * y).sum()
}
