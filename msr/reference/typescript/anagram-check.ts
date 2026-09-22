function is_anagram(a: string, b: string): boolean {
  const norm = (s: string) => [...s.toLowerCase()].filter((c) => c !== " ").sort().join("");
  return norm(a) === norm(b);
}
