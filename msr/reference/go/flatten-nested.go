package main

func flatten(xss [][]int) []int {
	out := []int{}
	for _, xs := range xss {
		out = append(out, xs...)
	}
	return out
}
