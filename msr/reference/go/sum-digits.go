package main

func sum_digits(n int) int {
	if n < 0 {
		n = -n
	}
	total := 0
	for n > 0 {
		total += n % 10
		n /= 10
	}
	return total
}
