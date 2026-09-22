fn remove_duplicates(xs : Array[Int]) -> Array[Int] {
  let out : Array[Int] = []
  for x in xs {
    if !out.contains(x) {
      out.push(x)
    }
  }
  out
}
