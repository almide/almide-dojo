# is-prime

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 2

## Final code

```almide
fn check(n: Int, i: Int) -> Bool = match i * i > n {
  true => true,
  false => match n % i == 0 {
    true => false,
    false => check(n, i + 1)
  }
}

fn is_prime(n: Int) -> Bool = match n > 1 {
  false => false,
  true => check(n, 2)
}

```
