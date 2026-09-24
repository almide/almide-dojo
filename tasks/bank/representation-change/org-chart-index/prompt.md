Modify the program below. Return the whole file.

Requested change:

- Index the chart instead of scanning the list: change `Org` to
  `type Org: Eq, Repr = { boss: Map[String, String], reports: Map[String, List[String]] }`
  (`boss` holds only employees that have a boss; `reports` maps a boss to their direct
  reports). `org(emps)` keeps its signature and builds both maps.
- Every reader keeps its signature and answers.

Preserve (the hidden oracle checks these):

- `reports` lists EVERY direct report, in the order the employees were listed.
- `team_size` counts everyone below, at any depth; someone with no reports has 0.
- `chain` goes up to the top; a boss who is not listed as an employee ends the chain.
- A name nobody knows has no boss, no reports and a team size of 0.
