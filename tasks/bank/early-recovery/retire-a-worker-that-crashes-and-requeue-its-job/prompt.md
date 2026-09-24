Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A crash is no longer fatal. The worker that crashed leaves the rotation for
  the rest of the run, and its job goes to the back of the queue to be run
  again later.
- When the worker that crashed was the only one left, the crash is fatal as
  before (`Crashed(worker, job)`).
- `run` is unchanged.

Preserve (the hidden oracle checks these on untouched inputs):

- The rotation goes on as if the crashed worker had never been in it: the next
  job goes to the worker that came after the crashed one (wrapping around to
  the first).
- A requeued job may crash again on another worker; that is handled the same
  way.
- `Timeout` and `BadJob` stay fatal with their payloads.
