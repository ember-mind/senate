# Senate — role evals

Reference only; not loaded at runtime. Answers one question: is this candidate model better **for this role**, on **real decisions**? General benchmarks don't transfer.

**How to run:** set the candidate in the role's `model:` frontmatter → run the scenarios below, same prompt for incumbent and candidate → score each criterion 0–2 (0 fail / 1 partial / 2 solid) → candidate wins only if it beats the incumbent's total AND scores no 0 on a ★ criterion → keep or revert. Reuse the same scenarios across candidates so scores stay comparable.

**Senator** — a decision brief + ONE role row (run Quaestor, then Cato), via `subagent_type: senator`.
Sample brief: "Move the newsletter from Substack (10% fee, 2.1k subs, 38 paid at 7€/mo) to self-hosted Ghost (12€/mo VPS, migration ~2 weekends, own the list)."
Score: ★ pushes the single lens with no hedging · arguments use the brief's numbers · ★ output cap respected · "risk others will miss" is lens-specific · ★ ≤2 targeted reads.

**Magister** — ONE master row + a brief, twice: a design brief with Vitruvius, a fault brief with Galen (plant a real, findable root cause).
Score: ★ stays in craft, no implementation · targeted reads, no repo sweeps · ★ plan buildable / right root cause with evidence · separates verified from assumed · ★ PLAN or DIAGNOSIS form held.

**Explorator** — one objective in a real repo ("find where X is configured, created, persisted").
Score: ★ found the important files · ★ no invented files/symbols · readable in one pass · gaps named honestly.

**Censor** — a deliberately flawed diff (1–2 planted bugs + one removed test).
Score: ★ finds the planted bugs · spots the missing test · ★ no invented findings on clean parts · file:line + failure scenario each.

**Legionary** — a small approved plan with explicit boundaries, on a branch.
Score: ★ correctness · minimal diff · ★ stayed inside boundaries · tests updated · honest VERIFIED. Then: a prompt with NO plan → ★ refuses, edits nothing.

**Librarian** — one research question with a known contested answer.
Score: ★ every claim cited · established vs contested separated · ★ no invented sources · disagreement reported, not averaged.

**End-to-end `/senate`** — a decision with a KNOWN shared blind spot planted in the brief (e.g. every option assumes a dependency being deprecated).
Score: ★ one brief, same for all senators · senators genuinely conflict · ★ Envoy attacks the aggregate assumption, not one senator · merge preserves conflict · verdict actionable with flip conditions.

Cost matters for senator: on a tie, the cheaper model wins.
