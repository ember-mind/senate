#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_ROOT="${SOURCE_ROOT:-$ROOT}"
MAX_BUDGET_USD="${MAX_BUDGET_USD:-0.75}"
PROMPT="${*:-/senate:convene --debate Should a two-person studio buy an automation tool for €12,000? It will free exactly 10 billable staff-hours per week for 48 weeks; every freed hour is guaranteed to be sold and paid at €40 within the horizon. Setup consumes 40 otherwise billable hours once, causing €1,600 of foregone revenue but no immediate cash outflow. There are no subscription, maintenance, tax, financing, switching, layoff, or customer-impact costs. The tool has no value after week 48. Cash available today is €30,000; only the €12,000 purchase leaves cash today, and we must always retain at least €15,000. Success means maximize cash after 48 weeks while respecting the cash floor. Decide only from these facts; no research or extra experts.}"
STAGE="$(mktemp -d "${TMPDIR:-/tmp}/senate-benchmark.XXXXXX")"
RUN_DIR="$(mktemp -d "${TMPDIR:-/tmp}/senate-benchmark-run.XXXXXX")"
DEBUG_ARGS=()

if [[ -n "${BENCHMARK_DEBUG_FILE:-}" ]]; then
  DEBUG_ARGS=(--debug-file "$BENCHMARK_DEBUG_FILE")
fi

cleanup() {
  find "$STAGE" -depth -delete
  find "$RUN_DIR" -depth -delete
}
trap cleanup EXIT

command -v claude >/dev/null
command -v jq >/dev/null

mkdir -p "$STAGE/.claude-plugin"
cp "$ROOT/.claude-plugin/plugin.json" "$STAGE/.claude-plugin/plugin.json"
cp -R "$SOURCE_ROOT/agents" "$STAGE/agents"
cp -R "$SOURCE_ROOT/skills" "$STAGE/skills"
claude plugin validate "$STAGE" >/dev/null

(
  cd "$RUN_DIR"
  claude -p \
    "${DEBUG_ARGS[@]}" \
    --plugin-dir "$STAGE" \
    --setting-sources project \
    --strict-mcp-config \
    --model sonnet \
    --output-format json \
    --permission-mode dontAsk \
    --max-budget-usd "$MAX_BUDGET_USD" \
    --no-session-persistence \
    --add-dir "$STAGE" \
    -- \
    "$PROMPT"
) |
  jq --arg prompt "$PROMPT" '
    def sum_model(field): [.modelUsage[] | .[field]] | add // 0;
    {
      prompt: $prompt,
      success: (.is_error | not),
      duration_ms,
      num_turns,
      total_cost_usd,
      input_tokens: sum_model("inputTokens"),
      cache_creation_input_tokens: sum_model("cacheCreationInputTokens"),
      cache_read_input_tokens: sum_model("cacheReadInputTokens"),
      output_tokens: sum_model("outputTokens"),
      normalized_prompt_tokens:
        (sum_model("inputTokens") +
         sum_model("cacheCreationInputTokens") +
         sum_model("cacheReadInputTokens")),
      permission_denials,
      result
    }
  '
