fn mat_add(a : Array[Array[Int]], b : Array[Array[Int]]) -> Array[Array[Int]] {
  a.mapi(fn(i, row) { row.mapi(fn(j, x) { x + b[i][j] }) })
}

fn mat_transpose(m : Array[Array[Int]]) -> Array[Array[Int]] {
  if m.is_empty() {
    return []
  }
  let out : Array[Array[Int]] = []
  for j in 0..<m[0].length() {
    out.push(m.map(fn(row) { row[j] }))
  }
  out
}

fn mat_scale(m : Array[Array[Int]], s : Int) -> Array[Array[Int]] {
  m.map(fn(row) { row.map(fn(x) { x * s }) })
}

fn mat_dot_row(row_a : Array[Int], col_b : Array[Int]) -> Int {
  let mut total = 0
  for i in 0..<row_a.length() {
    total = total + row_a[i] * col_b[i]
  }
  total
}
