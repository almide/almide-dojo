package main

func shiftText(text string, k int) string {
	out := []rune{}
	for _, c := range text {
		if c >= 'a' && c <= 'z' {
			off := ((int(c-'a')+k)%26 + 26) % 26
			out = append(out, rune('a'+off))
		} else {
			out = append(out, c)
		}
	}
	return string(out)
}

func encrypt(text string, shift int) string {
	return shiftText(text, shift)
}

func decrypt(text string, shift int) string {
	return shiftText(text, -shift)
}
