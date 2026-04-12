Define a linked list type and implement several operations on it.

Define this exact type:

    type MyList =
      | Nil
      | Cons(Int, MyList)

Write functions with these exact signatures:

    fn from_list(xs: List[Int]) -> MyList
    fn to_list(ml: MyList) -> List[Int]
    fn my_len(ml: MyList) -> Int
    fn my_map(ml: MyList, f: (Int) -> Int) -> MyList
    fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList
    fn my_reverse(ml: MyList) -> MyList

Behavior:

- `from_list([1, 2, 3])` creates `Cons(1, Cons(2, Cons(3, Nil)))`
- `to_list` converts back to a standard `List[Int]`
- `my_len(Nil)` returns `0`
- `my_map` applies `f` to each element
- `my_filter` keeps only elements satisfying `pred`
- `my_reverse` reverses the list

Notes:

- Use `match` with `Nil` and `Cons(head, tail)` patterns.
- Build all functions recursively.
- `from_list` can use `list.fold` with right-to-left accumulation, or recursion.
