Modify the program below. Return the whole file.

Requested change:

- Add `fn best_stores(regions: List[Region]) -> List[String]` returning one line
  per region, in order: `<region>: <store> <total>` for the region's store with
  the highest total, or `<region>: none` for a region without stores.

Preserve (the hidden oracle checks these):

- `store_total`, `region_total` and `overview` keep their exact behaviour.
- A store's total is its own sales only: a store with the same name in another
  region is a different store. The same name may even appear twice inside one
  region; each entry is its own store.
- Ties go to the store listed first in the region.
- Each region's store totals are a temporary of that region's step.
