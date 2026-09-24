Modify the program below. Return the whole file.

Requested change:

- Add an adapter `type Filtered: Pager = { inner: ListPager, prefix: String }` that
  pages over only the items of `inner` starting with `prefix`, using the same page
  size as `inner`: every page is full (`size` matching items) except the last.
- Add `type Listing = | All(ListPager) | Only(Filtered)` and
  `fn outline_of(l: Listing) -> String` and `fn count_of(l: Listing) -> Int` that run
  the generic `outline` / `count_items` with the selected pager.

Preserve (the hidden oracle checks these):

- `ListPager`, `all_pages`, `count_items`, `outline` and the protocol keep their
  exact behaviour (the generic walk still stops at the first empty page).
- Filtering must not lose matches: a stretch of the inner list with no match does
  not end the walk early, and matching items keep their order.
- `Filtered.page(n)` with `n < 1` or past the last match is empty; no match at all
  gives an empty outline and a count of 0.
