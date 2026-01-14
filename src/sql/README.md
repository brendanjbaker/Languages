# SQL

Postgres cannot directly return an exit/status code.

Therefore, its output will be in this format:

`<status>,<output>`

That is, the `status`, a comma `,`, and finally `output` text.

For example:

* `0,12:34` → Status `0`, output `12:34`
* `1,00:00` → Status `1`, output empty
* `2,00:00` → Status `2`, output empty

The `main.sh` bash script parses this, and writes output and exits accordingly.

Output is only written when `status` is `0`.
