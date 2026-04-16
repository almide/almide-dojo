# custom-linked-list

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn from_list(xs: List[Int]) -> MyList = match list.first(xs) {
  none => Nil,
  some(h) => Cons(h, from_list(list.drop(xs, 1))),
}

fn to_list(ml: MyList) -> List[Int] = match ml {
  Nil => [],
  Cons(h, t) => [h] + to_list(t),
}

fn my_len(ml: MyList) -> Int = match ml {
  Nil => 0,
  Cons(_, t) => 1 + my_len(t),
}

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList = match ml {
  Nil => Nil,
  Cons(h, t) => Cons(f(h), my_map(t, f)),
}

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList = match ml {
  Nil => Nil,
  Cons(h, t) => if pred(h) then Cons(h, my_filter(t, pred)) else my_filter(t, pred),
}

fn my_reverse_helper(ml: MyList, acc: MyList) -> MyList = match ml {
  Nil => acc,
  Cons(h, t) => my_reverse_helper(t, Cons(h, acc)),
}

fn my_reverse(ml: MyList) -> MyList = my_reverse_helper(ml, Nil)
```
