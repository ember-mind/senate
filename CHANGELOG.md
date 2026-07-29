# Changelog

## Unreleased

- Split runtime instructions into route-specific references so each request loads only the workflow it uses.
- Lowered Consul default effort from `xhigh` to `high`; Magister and Censor now use `sonnet` by default and escalate individual high-risk calls to `opus`.
- Removed tools from senators, added hard output budgets and research stop rules, and added risk-based post-build Censor verification.
- Made the cross-family Envoy opt-in through `--cross-check`, and added a live consumption benchmark with token, cost, latency, and provenance gates.
- Collapsed the five first-pass senator processes and `--debate` into one sealed, bounded `bench` sitting.
- Documented long-running campaigns with a Tabularium workflow image, explicit cross-session resume rules, and evaluation coverage.

## 1.0.0

First public release.

- `/senate:convene` (plugin) or `/convene` (source) — the Consul routes each request to an organ: decisions to a bench of five conflicting senators plus a cross-family Envoy attacking their consensus; designs and diagnoses to the Collegium; research to the Library; review to the Censors; reconnaissance to the Scouts; building to the Legions (approved plans only).
- Flags: `--debate` (one rebuttal round), `--log` (append the verdict to a project `MEMORY.md`).
- Distributed as a Claude Code plugin (`.claude-plugin/`) and via `install.sh`.
- Right model for each duty: sub-agents pinned to cost tiers via portable model-family aliases (senators `sonnet`, scouts `haiku`, masters and censors `opus`); the Consul inherits your session model so your best model makes the judgment. `MODEL-POLICY.md` explains how to change or flatten the tiers.
- MIT licensed.
