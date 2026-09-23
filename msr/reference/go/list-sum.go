package main

func list_sum(xs []int) int {
	total := 0
	for _, x := range xs {
		total += x
	}
	return total
}
