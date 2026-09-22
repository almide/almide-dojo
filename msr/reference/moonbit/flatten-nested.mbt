fn flatten(xss : Array[Array[Int]]) -> Array[Int] {
  let out : Array[Int] = []
  for xs in xss {
    for x in xs {
      out.push(x)
    }
  }
  out
}
