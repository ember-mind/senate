# Legions — Implementation

Use for approved plan or true skirmish. Consul never edits.

## Skirmish

A skirmish must be unambiguous, reversible, non-destructive, about 1–2 files, and free of architectural choice.

Announce:

> ⚔️ A cohort is enough — the Legions march.

Cut one-line order containing goal, exact file boundary, definition of done, and required check. Dispatch one `legionary`.

- Use invocation `model: haiku` for copy, typo, literal rename, or one config value.
- Use default `sonnet` when code behavior changes.
- Report changed file and actual verification.

If boundary or behavior is uncertain, it is not a skirmish. Send to Collegium.

## Campaign

Require user approval of concrete plan.

Announce first wave:

> ⚔️ The Legions march.

For later waves:

> ⚔️ The Legions march — <N> cohorts, wave <i> of <n>.

### Cut orders

- One order equals one agent session and one independently verifiable result.
- Include exact goal, file boundaries, plan steps, constraints, definition of done, and checks.
- Never assign same file to two cohorts in one wave.
- Run independent orders in parallel; dependent orders wait.
- Cap one wave at three cohorts. More parallelism increases duplicated context and collision risk.
- If one order must explore half repository, precede it with Scout or split order.

Use `subagent_type: legionary`, default `sonnet`. Name cohorts in order: `Legio-X-Fretensis`, `Legio-XIII-Gemina`, `Legio-VI-Ferrata`, `Legio-II-Augusta`, `Legio-V-Macedonica`, then task slug.

Relay capped reports. Do not reread every changed file in Consul context.

## Verification gate

Legionary must run relevant checks and report actual result.

After final wave, dispatch independent Censor automatically when any condition holds:

- security, authentication, permissions, payments, migration, or user-data change;
- behavior changed across three or more files;
- destructive or hard-to-reverse operation;
- test failed, was skipped, or coverage is uncertain.

Use `censor` with `model: opus` for security or data-loss risk; otherwise `sonnet`. For low-risk skirmish, Legionary self-check is enough.

Final answer contains changed files, checks, remaining risk, and one next step.

## Tabularium for multi-session campaigns

Create `TABULARIUM.md` only when campaign outlives one conversation. Keep one live campaign:

```markdown
---
type: campaign
campaign: <name>
---

## Destination
<one or two lines>

## Settled
- [YYYY-MM-DD] <result> — <pointer>

## Standing orders
<binding constraints>

## Open
<next dispatchable order>

## Fog
<known later work not yet sharp enough>
```

Update one line after each wave or verdict. Archive or remove when campaign ends.
