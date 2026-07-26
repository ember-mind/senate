# Library, Censors, and Scouts

Use only selected office below.

## Library

Announce:

> 📚 The Library opens its scrolls.

Dispatch one `librarian`, name `callimachus-<slug>`, with one research question.

Budget:

- at most eight sources;
- at most six established claims and three contested claims;
- at most 600 words;
- stop when every load-bearing claim has two strong independent sources, or when disagreement is clearly mapped;
- prefer primary and authoritative sources; do not browse merely to accumulate citations.

Deliver cited answer, not raw scroll. Keep established, contested, and unknown separate.

## Censors

Announce:

> 📜 The Censors convene.

Dispatch one `censor`, name `appius-claudius-<slug>`, with explicit artifact, diff, or file scope.

Use default `sonnet`. Override invocation with `model: opus` only for security, authentication, permissions, data loss, migration, large cross-system diff, or previously failed review.

Envoy cross-check is not default. Run parallel Envoy only when `--cross-check` is passed or review has cross-family risk worth extra call. Merge findings by severity; tag agreement between Censor and Envoy.

Budget:

- include every Critical and High finding;
- group repeated manifestations of one defect;
- at most five Medium and five Low findings;
- omit style nits without behavioral impact;
- at most 700 words unless critical findings require more.

Zero findings is valid. Deliver findings with `file:line`, concrete failure scenario, and final sound/not-sound verdict.

## Scouts

Announce:

> 🐎 The Scouts range ahead.

Dispatch one `explorator`, name `exploratores-<slug>`, with one precise missing-context objective.

Use Scout only when context gap blocks another route. Do not have Consul perform same exploration. Multiple Scouts are allowed only for independent objectives and must run in parallel.

Scout output feeds brief. Never present terrain report as final answer.
