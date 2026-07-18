# Role Evals

Lightweight manual evaluation suite for deciding whether a new model should take over a role. The question each eval answers:

> Is this new model better **for this specific role** on **real decisions**?

Not "is this model generally better" — general benchmarks don't transfer to a narrowly-scoped role.

## How to run an eval

1. Pick the role and a candidate model.
2. Temporarily set the candidate in the role's `model:` frontmatter (see MODEL-POLICY.md for locations).
3. Run the role's scenarios below — same prompt for incumbent and candidate.
4. Score each criterion 0–2 (0 failed / 1 partial / 2 solid). Sum per scenario, average across scenarios.
5. Candidate wins the role only if it beats the incumbent's total AND has no 0 on a critical criterion (marked ★).
6. Revert or keep the binding; record the outcome in MODEL-POLICY.md's binding history.

Keep a small table per run:

```
Role: senator   Candidate: <model>   Incumbent: <model>   Date: YYYY-MM-DD
Scenario | Criterion | Incumbent | Candidate
...
Total    |           |    X      |    Y
Decision: keep / switch — reason
```

---

## Senator eval

Scenario: hand the candidate a decision brief plus ONE role row (use Quaestor, then Cato — the two most demanding lenses), via Agent tool, `subagent_type: senator`.

```
Brief: "Move the newsletter from Substack (10% fee, 2.1k subs, 38 paid at 7€/mo)
to self-hosted Ghost (12€/mo VPS, migration ~2 weekends, own the list)."
Row: <one roster row verbatim>
```

Score:
- ★ pushes the single lens hard (no hedging, no "on the other hand")
- arguments grounded in the brief's numbers, not generic
- ★ respects the output cap (structure followed, ≤2 sentences per argument)
- "risk others will miss" is genuinely lens-specific, not restated consensus
- ★ read discipline (≤2 targeted reads, no exploration)

## Magister eval

Scenario: hand the candidate ONE master row + a brief, via Agent tool, `subagent_type: magister`. Run twice: a design brief with Vitruvius's row, a fault brief with Galen's row (plant a real, findable root cause in a small repo).

Score:
- ★ stays in craft (no generalist drift, no implementation)
- reads with intent (targeted reads answering method questions, no repo sweeps)
- ★ plan is buildable / diagnosis convicts the right root cause with evidence
- separates verified from assumed; names what's missing instead of inventing
- ★ respects the output form (PLAN or DIAGNOSIS structure, caps held)

## /senate end-to-end eval

Scenario: run `/senate` on a decision with a KNOWN shared blind spot planted in the brief — e.g. all options assume a dependency that is being deprecated. Good outcome: the Envoy (or the merge) catches the shared assumption.

Score:
- ★ brief distilled once, all senators receive the same brief
- senators genuinely conflict (verdicts/arguments not interchangeable)
- ★ Envoy attacks the aggregate assumption, not one senator's point
- merge preserves conflict (names contradictions + costs; no mushy averaging)
- verdict is actionable: for/against/conditional with flip conditions

---

## Notes

- 2–3 scenarios per role beat 1; reuse the same scenarios across candidates so scores stay comparable.
- Cost matters for senator: if scores tie, the cheaper/faster model wins.
- Keep completed score tables below this line, newest first.
