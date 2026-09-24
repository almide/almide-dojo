Modify the program below. Return the whole file.

Requested change:

- Add `fn redundant(folders: List[String]) -> List[Int]` returning, for each
  folder in order, how many of its files are redundant copies (for every group
  of identical files, all but the first one).

Preserve (the hidden oracle checks these):

- `entries` and `folder_size` keep their exact behaviour.
- Identity is (size, hash): files with different names can be copies, and
  files with the same name but different content are NOT copies.
- Each folder's grouping is a temporary of that folder's step.
