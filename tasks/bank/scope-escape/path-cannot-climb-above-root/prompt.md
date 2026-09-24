Modify the program below. Return the whole file.

Requested change:

- Add `fn normalize(p: String) -> String` returning the simplified absolute
  path ("/a/c" for "/a/./b/../c", "/" for the root), or `relative path` when
  `p` is not absolute.

Preserve (the hidden oracle checks these):

- `segments`, `is_absolute` and `mentions_parent` keep their exact behaviour.
- ".." at the root is ignored: "/../a" is "/a", and "/a/../../b" is "/b".
- The directory stack is a temporary of `normalize`: return only the string.
