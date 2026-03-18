---
name: ask-codex
description: This skill should be used when the user asks to "ask codex", "get a second opinion from codex", "what does codex think about this", "consult codex", "get codex's opinion", "ask openai about this", "codex review", "review with codex", "ask codex to review", "codex に聞いて", "codex の意見を聞かせて", "codex でレビューして", "codex にレビューを頼んで".
---

# ask-codex

Get a second opinion from the OpenAI Codex CLI on a coding question, design discussion, or code review.

## Goal

Pass the user's request to the Codex CLI (`codex exec` or `codex exec review`) in non-interactive mode, then present Codex's response. The skill operates in one of three modes depending on the user's intent.

## Modes

| Mode | Trigger examples | Command |
|------|-----------------|---------|
| Code Review | "codex review", "codex でレビューして" | `codex exec review` |
| Design Discussion | "design", "architecture", "設計", "what do you think about" | `codex exec` |
| General Question | anything else | `codex exec` |

## Steps

### 1. Determine the mode

Identify the mode from the user's message:

- **Code Review**: the user explicitly asks Codex to review code changes (e.g., diff, uncommitted changes, a branch, a commit).
- **Design Discussion**: the user wants to discuss architecture, design choices, or implementation strategy.
- **General Question**: all other requests.

If the mode cannot be determined, ask the user before proceeding.

### 2. Gather context

**Code Review mode** — identify the review target:

| Target | Flag |
|--------|------|
| Staged / unstaged changes | `--uncommitted` |
| Diff from a branch | `--base <branch>` |
| A specific commit | `--commit <sha>` |

If the target is not clear from the user's message, ask before proceeding.

**Design Discussion / General Question mode** — collect:

- **User's question**: the question or instruction provided in the current message.
- **Selected code** (if any): code highlighted in the IDE, provided via `ide_selection` tags.

If neither a question nor selected code is available, ask the user what they would like Codex to review before proceeding.

### 3. Construct the prompt

**Code Review mode**: skip this step — `codex exec review` does not take a free-text prompt.

**Design Discussion / General Question mode** — build a single prompt string. When selected code is present, include it with the question:

```
<question>
{user's question}
</question>

<code>
{selected code}
</code>
```

When there is no selected code, pass the question alone. Keep the prompt concise and do not include Claude's own analysis.

### 4. Invoke Codex

Use `-o /tmp/codex-response.txt --ephemeral -s read-only` for all modes. The `-o` flag writes output to a file for reliable retrieval; `--ephemeral` avoids leaving session artifacts; `-s read-only` prevents Codex from modifying any files.

**Code Review mode:**

```bash
# Uncommitted changes
codex exec review -o /tmp/codex-response.txt --ephemeral -s read-only --uncommitted

# Diff from a branch
codex exec review -o /tmp/codex-response.txt --ephemeral -s read-only --base <branch>

# Specific commit
codex exec review -o /tmp/codex-response.txt --ephemeral -s read-only --commit <sha>
```

**Design Discussion / General Question mode:**

```bash
codex exec -o /tmp/codex-response.txt --ephemeral -s read-only "$(cat <<'EOF'
{prompt}
EOF
)"
```

### 5. Read the output

Use the `Read` tool to retrieve Codex's response from `/tmp/codex-response.txt`.

### 6. Present the result

1. State the review target at the top for Code Review mode (e.g., "Review target: uncommitted changes").
2. Quote Codex's output verbatim under a **Codex says** heading.
3. If Claude's perspective differs or there is useful additional context, add a brief **Claude's note** section below.

Keep the presentation neutral — the user requested a second opinion, so both views should be visible.
