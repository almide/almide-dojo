Modify the program below. Return the whole file.

Requested change:

- Store the place as a number: change `Result.place: String` to `Result.place: Int`
  and make `result(runner, place)` take an `Int`. Drop `number`.
- `render` prints the place with its English ordinal suffix: `1st`, `2nd`, `3rd`,
  `4th`, `21st`, `22nd`, `101st`.

Preserve (the hidden oracle checks these):

- The suffix rule is the English one: 11, 12 and 13 take `th` (`11th`, `12th`,
  `13th`, and likewise `111th`, `112th`, `213th`), while 21, 22, 23, 101, 102 take
  `st`, `nd`, `rd`.
- `ranking` orders by place number (`9th` before `10th`) and keeps list order for ties;
  `podium` lists places 1 to 3 in that order.
