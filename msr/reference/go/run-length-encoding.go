package main

import (
	"strconv"
	"strings"
)

func rle_encode(s string) string {
	var b strings.Builder
	for i := 0; i < len(s); {
		j := i
		for j < len(s) && s[j] == s[i] {
			j++
		}
		b.WriteString(strconv.Itoa(j - i))
		b.WriteByte(s[i])
		i = j
	}
	return b.String()
}

func rle_decode(s string) string {
	var b strings.Builder
	for i := 0; i+1 < len(s); i += 2 {
		n := int(s[i] - '0')
		b.WriteString(strings.Repeat(string(s[i+1]), n))
	}
	return b.String()
}
