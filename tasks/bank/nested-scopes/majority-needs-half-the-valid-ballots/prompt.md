Modify the program below. Return the whole file.

Requested change:

- Add `fn results(districts: List[String]) -> List[String]` returning, for each
  district in order, the candidate with an absolute MAJORITY — more than half
  of the VALID ballots — or `no majority`.

Preserve (the hidden oracle checks these):

- `ballots`, `valid` and `turnout` keep their exact behaviour.
- A plurality is not enough: 4 of 10 valid ballots is no majority even if it
  is the most votes. Exactly half is not a majority. Spoilt ballots are not
  counted in the total.
- Each district's tally is a temporary of that district's step.
