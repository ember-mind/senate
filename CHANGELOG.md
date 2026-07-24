# Changelog

## 1.0.0

First public release.

- `/senate` Consul routes each request to an organ: decisions to a bench of five conflicting senators plus a cross-family Envoy attacking their consensus; designs and diagnoses to the Collegium; research to the Library; review to the Censors; reconnaissance to the Scouts; building to the Legions (approved plans only).
- Flags: `--debate` (one rebuttal round), `--log` (append the verdict to a project `MEMORY.md`).
- Distributed as a Claude Code plugin (`.claude-plugin/`) and via `install.sh`.
- No model is pinned — every role inherits the session model; `MODEL-POLICY.md` documents the opt-in per-role cost tiers.
- MIT licensed.
