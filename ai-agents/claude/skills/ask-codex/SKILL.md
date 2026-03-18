---
name: ask-codex
description: This skill should be used when the user asks to "ask codex", "get a second opinion from codex", "what does codex think about this", "consult codex", "get codex's opinion", "ask openai about this", "codex に聞いて", "codex の意見を聞かせて".
---

# ask-codex

Get a second opinion from the OpenAI Codex CLI on a coding question or selected code.

## Goal

Pass the user's question and any selected code to the Codex CLI (`codex exec`) in non-interactive mode, then present Codex's response. This provides an independent perspective alongside Claude's own analysis.

## Steps

### 1. Gather context

Collect the following inputs:

- **User's question**: The question or instruction provided in the current message.
- **Selected code** (if any): Any code highlighted in the IDE, provided via `ide_selection` tags in the conversation context.

If neither a question nor selected code is available, ask the user what they would like Codex to review before proceeding.

### 2. Construct the prompt

Build a single prompt string to pass to Codex. When selected code is present, include it with the question:

```
<question>
{user's question}
</question>

<code>
{selected code}
</code>
```

When there is no selected code, pass the question alone.

Keep the prompt concise. Do not include Claude's own analysis or opinions — the goal is to get an unbiased response from Codex.

### 3. Invoke Codex

Run `codex exec` in non-interactive, read-only mode:

```bash
codex exec -s read-only "$(cat <<'EOF'
{prompt}
EOF
)"
```

Use the heredoc form to safely handle multi-line prompts. The `-s read-only` flag prevents Codex from modifying any files.

### 4. Present the result

After Codex responds:

1. Quote Codex's output verbatim under a **Codex says** heading.
2. If Claude's perspective differs or there is useful additional context, add a brief **Claude's note** section below.

Keep the presentation neutral — the user requested a second opinion, so both views should be visible.
