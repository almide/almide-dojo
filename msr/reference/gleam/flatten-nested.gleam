import gleam/list

pub fn flatten(xss: List(List(Int))) -> List(Int) {
  list.flatten(xss)
}
