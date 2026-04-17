# custom-linked-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
## MyList Implementation

type MyList =
    | Nil
    | Cons(Int, MyList);

fn from_list(xs: List[Int]) -> MyList {
    match xs {
        List::Nil => Nil,
        List::Cons(x, xs) => Cons(x, from_list(xs)),
    }
}

fn to_list(ml: MyList) -> List[Int] {
    match ml {
        Nil => List::Nil,
        Cons(x, ml) => List::Cons(x, to_list(ml)),
    }
}

fn my_len(ml: MyList) -> Int {
    match ml {
        Nil => 0,
        Cons(_, ml) => 1 + my_len(ml),
    }
}

fn my_map(ml: MyList, f: fn(Int) -> Int) -> MyList {
    match ml {
        Nil => Nil,
        Cons(x, ml) => Cons(f(x), my_map(ml, f)),
    }
}

fn my_filter(ml: MyList, pred: fn(Int) -> Bool) -> MyList {
    match ml {
        Nil => Nil,
        Cons(x, ml) => if pred(x) {
            Cons(x, my_filter(ml, pred))
        } else {
            my_filter(ml, pred
```
