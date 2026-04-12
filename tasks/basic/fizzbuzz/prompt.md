Write a function with this exact signature:

    fn fizzbuzz(n: Int) -> String

Behavior:

- Return `"FizzBuzz"` if `n` is divisible by 15
- Return `"Fizz"` if `n` is divisible by 3 (but not 15)
- Return `"Buzz"` if `n` is divisible by 5 (but not 15)
- Otherwise return the decimal string of `n`

Notes:

- Use `int.to_string(n)` to convert an integer to its decimal string.
- Assume `n >= 1`.
