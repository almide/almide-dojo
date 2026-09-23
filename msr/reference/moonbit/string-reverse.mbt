fn reverse(s : String) -> String {
  let cs = s.to_array()
  cs.rev_inplace()
  String::from_array(cs)
}
