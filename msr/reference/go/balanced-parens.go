package main

func is_balanced(s string) bool {
	closer := map[rune]rune{'(': ')', '[': ']', '{': '}'}
	stack := []rune{}
	for _, c := range s {
		if cl, ok := closer[c]; ok {
			stack = append(stack, cl)
		} else if c == ')' || c == ']' || c == '}' {
			if len(stack) == 0 || stack[len(stack)-1] != c {
				return false
			}
			stack = stack[:len(stack)-1]
		}
	}
	return len(stack) == 0
}
