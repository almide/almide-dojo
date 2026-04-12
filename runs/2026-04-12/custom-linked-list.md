# custom-linked-list

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
type MyList =
  | Nil
  | Cons(Int, MyList)

fn to_list(ml: MyList) -> List[Int] =
  match ml {
    Nil => [],
    Cons(head, tail) => [head] + to_list(tail),
  }

fn my_len(ml: MyList) -> Int =
  match ml {
    Nil => 0,
    Cons(_, tail) => 1 + my_len(tail),
  }

fn my_map(ml: MyList, f: (Int) -> Int) -> MyList =
  match ml {
    Nil => Nil,
    Cons(head, tail) => Cons(f(head), my_map(tail, f)),
  }

fn my_filter(ml: MyList, pred: (Int) -> Bool) -> MyList =
  match ml {
    Nil => Nil,
    Cons(head, tail) =>
      if pred(head) then Cons(head, my_filter(tail, pred))
      else my_filter(tail, pred),
  }

fn my_reverse_go(src: MyList, acc: MyList) -> MyList =
  match src {
    Nil => acc,
    Cons(head, tail) => my_reverse_go(tail, Cons(head, acc)),
  }

fn my_reverse(ml: MyList) -> MyList =
  my_reverse_go(ml, Nil)

fn from_list(xs: List[Int]) -> MyList =
  my_reverse(list.fold(xs, Nil, (acc, x) => Cons(x, acc)))
```
