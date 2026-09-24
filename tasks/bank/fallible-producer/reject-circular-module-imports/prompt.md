Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Import cycles are now an error. When the walk reaches a module that it is
  still in the middle of building, `build_order` fails with
  `import cycle: <chain>`, the chain running from that module through every
  import that led back to it and ending with it again (for example
  `import cycle: ui -> widgets -> ui`). A module that imports itself is the
  cycle `a -> a`.

Preserve (the hidden oracle checks these on untouched inputs):

- Only a real cycle is an error. A module imported by several others (for
  example two modules that both import `core`) is fine and is built once.
- Report the first cycle the existing walk meets: modules in line order,
  imports in listed order. When the walk meets an unknown module before any
  cycle, the unknown-module error is reported with its existing text, and the
  other way round.
- Every line is parsed and checked for duplicates before the walk (those errors
  come first). The build order for inputs without cycles is unchanged.
