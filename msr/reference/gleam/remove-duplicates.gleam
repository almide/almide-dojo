import gleam/list

pub fn remove_duplicates(xs: List(Int)) -> List(Int) {
  list.unique(xs)
}
