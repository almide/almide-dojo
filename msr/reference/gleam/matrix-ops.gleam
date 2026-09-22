import gleam/int
import gleam/list

pub fn mat_add(a: List(List(Int)), b: List(List(Int))) -> List(List(Int)) {
  list.map2(a, b, fn(ra, rb) { list.map2(ra, rb, fn(x, y) { x + y }) })
}

pub fn mat_transpose(m: List(List(Int))) -> List(List(Int)) {
  list.transpose(m)
}

pub fn mat_scale(m: List(List(Int)), s: Int) -> List(List(Int)) {
  list.map(m, fn(row) { list.map(row, fn(x) { x * s }) })
}

pub fn mat_dot_row(row_a: List(Int), col_b: List(Int)) -> Int {
  list.map2(row_a, col_b, fn(x, y) { x * y }) |> int.sum
}
