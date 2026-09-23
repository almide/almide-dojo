function count_vowels(s: string): number {
  return [...s].filter((c) => "aeiou".includes(c)).length;
}
