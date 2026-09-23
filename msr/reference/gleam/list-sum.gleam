import gleam/list

pub fn list_sum(xs: List(Int)) -> Int {
  list.fold(xs, 0, fn(acc, x) { acc + x })
}
