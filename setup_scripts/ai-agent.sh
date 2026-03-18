#!/bin/sh

if command -v claude > /dev/null 2>&1; then
  mkdir -p $HOME/.claude
  ln -sf $HOME/dotfiles/ai-agents/MASTER-AGENTS.md $HOME/.claude/CLAUDE.md
  ln -sf $HOME/dotfiles/ai-agents/claude/settings.json $HOME/.claude/settings.json
  ln -sf $HOME/dotfiles/ai-agents/claude/skills $HOME/.claude/
fi
