function is_palindrome(s: string): boolean {
  return [...s].reverse().join("") === s;
}
