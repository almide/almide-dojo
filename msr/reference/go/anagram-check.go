package main

import (
	"sort"
	"strings"
)

func normalize(s string) string {
	cs := strings.Split(strings.ReplaceAll(strings.ToLower(s), " ", ""), "")
	sort.Strings(cs)
	return strings.Join(cs, "")
}

func is_anagram(a string, b string) bool {
	return normalize(a) == normalize(b)
}
