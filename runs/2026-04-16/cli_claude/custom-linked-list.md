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

fn from_list(xs: List[Int]) -> MyList =
  list.fold(list.reverse(xs), Nil, (acc, x) => Cons(x, acc))

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
    Cons(head, tail) => if pred(head) then Cons(head, my_filter(tail, pred)) else my_filter(tail, pred),
  }

fn my_reverse_helper(ml: MyList, acc: MyList) -> MyList =
  match ml {
    Nil => acc,
    Cons(head, tail) => my_reverse_helper(tail, Cons(head, acc)),
  }

fn my_reverse(ml: MyList) -> MyList =
  my_reverse_helper(ml, Nil)
```
