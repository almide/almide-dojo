package main

func mat_add(a [][]int, b [][]int) [][]int {
	out := [][]int{}
	for i := range a {
		row := []int{}
		for j := range a[i] {
			row = append(row, a[i][j]+b[i][j])
		}
		out = append(out, row)
	}
	return out
}

func mat_transpose(m [][]int) [][]int {
	out := [][]int{}
	if len(m) == 0 {
		return out
	}
	for j := 0; j < len(m[0]); j++ {
		col := []int{}
		for i := range m {
			col = append(col, m[i][j])
		}
		out = append(out, col)
	}
	return out
}

func mat_scale(m [][]int, s int) [][]int {
	out := [][]int{}
	for _, r := range m {
		row := []int{}
		for _, x := range r {
			row = append(row, x*s)
		}
		out = append(out, row)
	}
	return out
}

func mat_dot_row(row_a []int, col_b []int) int {
	total := 0
	for i := range row_a {
		total += row_a[i] * col_b[i]
	}
	return total
}
