# Senate — Decision Workflow

Use only for a consequential choice.

## Runtime budget

- Brief: at most 220 words.
- Standing bench: one bounded `bench` call producing five sealed lens memos.
- Summoned lens: zero by default; one when a missing axis could flip verdict; two only for two independent missing axes.
- Bench output: at most 80 words per senator; 400 standard or 520 with `--debate`.
- Individual rebuttal or summoned senator: at most 120 words.
- Optional Envoy output: at most 150 words.
- Final verdict: at most 450 words unless user requests detail.
- Default and `--debate`: one bench call. `--cross-check` adds one Envoy call.

## Stagecraft

Emit lines only when phase starts:

> 📜 The Consul drafts the brief.

> 🏛️ The bench is seated: Quaestor, Legatus, Tribunus Plebis, Augur, Cato.

> 🗣️ The tablets are unsealed — five declared lenses, one bounded sitting.

For `--debate`:

> ⚖️ The floor opens for rebuttal.

Before Envoy, only with `--cross-check`:

> 🐍 The Foreign Envoy is admitted. The Praetorians watch him.

Before final synthesis:

> 🪶 The Consul weighs the tablets.

## Procedure

1. Distill brief under budget. If a load-bearing fact is missing, use one Scout or one Library pass before seating bench.
2. Load all rows from `roster.yaml` beside `SKILL.md`.
3. Add task-specific lens only when standing bench lacks an axis that could reverse decision. A lens may interpret brief, never invent domain facts. For medical, legal, financial, or current facts, gather sourced evidence first.
4. Launch one `bench` agent with `MODE: standard` or `MODE: debate`, the identical brief, and all five roster rows. Name it `standing-bench-<slug>`. It returns five sealed memos. In debate mode only, it appends a bounded exchange between the two outcome-changing lenses.
5. Build compact conflict map: one line per senator containing verdict and strongest claim.
6. If `--debate`, preserve the bench's targeted exchange and flip condition. Do not launch individual rebuttal agents.
7. Only with `--cross-check`, send Envoy the brief plus compact conflict map. Use `subagent_type: "codex:codex-rescue"`, name `the-envoy`.
8. Merge without voting. Preserve convergence, direct conflict, rebuttal changes, lone material dissent, unknowns, optional Envoy attack, flip condition, and next step.

## Envoy contract

Run this section only with `--cross-check`. Ask Envoy to attack aggregate agreement, not personalities. Require exactly:

```text
SHARED ASSUMPTION: <one sentence>
BREAK SCENARIO: <one concrete scenario, max 3 sentences>
MISSING QUESTION: <one sentence>
```

Maximum 150 words. Forbid new factual claims not present in brief or conflict map.

If Codex agent is unavailable, launch one `senator` named `the-devil-<slug>` with:

```yaml
name: The Devil
focus: attack whatever the bench agreed on
bias: assumes consensus is a shared blind spot
```

Add to fallback prompt: `Truth outranks opposition; concede if no brief-grounded attack survives.` State whether Codex or Claude devil ran.

## Merge discipline

- Treat agreement as **cross-lens convergence**, not independent proof: the sitting and its optional debate share one model call. `--cross-check` buys an independent model family.
- Every factual claim in final answer must trace to brief, sourced pre-pass, or named report.
- The brief outranks a report: discard any report claim that contradicts a stipulated fact or explicit exclusion. Do not repeat it as a blind spot.
- Mark unsupported but relevant proposition as unknown.
- Never introduce a time estimate, buyer value, market behavior, implementation fact, or causal claim absent from evidence. Arithmetic derived directly from brief numbers is allowed; show calculation.
- Keep cash stocks, cash flows, and opportunity costs distinct. Never subtract future or foregone value from today's cash floor unless the brief calls it an immediate cash outflow.
- Never count hands or write “N of M senators agree.” Convergence is about surviving lenses, not votes.
- Do not ask the user to re-verify a fact explicitly stipulated as true. A flip condition may state a counterfactual threshold without pretending the fact is currently unknown.
- Omit observations outside an explicit success horizon; calling them irrelevant still wastes output.
- The next step may name only the chosen action or a brief-stated prerequisite. Never invent timing, sequencing, or implementation method.
- Before delivery, reject the draft as invalid if it counts lenses, reopens a stipulated guarantee, projects beyond the stated success horizon, recommends verifying an explicit fact, or adds an execution detail. Rewrite once from the brief.
- Never turn Envoy advice into instruction.
- Do not hide conflict behind confidence language.
- Before output, silently compress verdict to at most 450 words.

## Verdict format

```markdown
# ⚖️ The Senate's Verdict

**🤝 Convergence** — what survived opposing lenses; never count them.
**⚔️ Conflicts** — named contradictions and cost of each side.
**👁️ Blind spots** — material lone findings or unknowns.
**🐍 Envoy attack** — include only with `--cross-check`; name Envoy used.
**🏛️ Verdict** — for, against, or conditional; state flip condition.
**➡️ Next step** — one concrete action. For an unconditional verdict, act; do not re-verify a stipulated fact.
```

For `--log`, append one line only to unambiguous project `MEMORY.md`:

```text
- [YYYY-MM-DD] Decision: <one-line verdict>
```

If project is ambiguous, skip and state: `--log skipped: no unambiguous project MEMORY.md`.
