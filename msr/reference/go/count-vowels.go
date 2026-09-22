package main

import "strings"

func count_vowels(s string) int {
	n := 0
	for _, c := range s {
		if strings.ContainsRune("aeiou", c) {
			n++
		}
	}
	return n
}
