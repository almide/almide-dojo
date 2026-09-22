function is_balanced(s: string): boolean {
  const closer: Record<string, string> = { "(": ")", "[": "]", "{": "}" };
  const stack: string[] = [];
  for (const c of s) {
    if (c in closer) stack.push(closer[c]);
    else if (c === ")" || c === "]" || c === "}") {
      if (stack.pop() !== c) return false;
    }
  }
  return stack.length === 0;
}
