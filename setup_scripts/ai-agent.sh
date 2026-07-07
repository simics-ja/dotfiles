#!/bin/sh

if command -v claude > /dev/null 2>&1; then
  mkdir -p $HOME/.claude
  ln -sf $HOME/dotfiles/ai-agents/MASTER-AGENTS.md $HOME/.claude/CLAUDE.md
  for entry in $HOME/dotfiles/ai-agents/claude/*; do
    ln -sf "$entry" "$HOME/.claude/"
  done
fi

if command -v codex > /dev/null 2>&1; then
  mkdir -p $HOME/.codex
  ln -sf $HOME/dotfiles/ai-agents/MASTER-AGENTS.md $HOME/.codex/AGENTS.md
  for entry in $HOME/dotfiles/ai-agents/codex/*; do
    ln -sf "$entry" "$HOME/.codex/"
  done
fi
