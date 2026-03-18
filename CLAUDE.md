# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

```sh
# Full setup (macOS)
sh setup.sh

# Linux with Homebrew
sh setup.sh --homebrew

# Linux with APT
sh setup.sh
```

The setup script runs modular scripts in `setup_scripts/` sequentially: zsh → package manager → config symlinks → AI agent.

To re-run only a specific step:

```sh
sh setup_scripts/tools.sh      # Re-apply all config symlinks
sh setup_scripts/ai-agent.sh   # Re-apply AI agent configs only
```

## Architecture

This repo manages macOS/Linux dotfiles via symlinks. `setup_scripts/tools.sh` is the central script that creates all symlinks from this repo into `$HOME`.

### Config directories by tool

| Directory | Tool | Symlink target |
|-----------|------|----------------|
| `zsh/` | Zsh | `~/.zshrc`, `~/.zprofile` |
| `git/` | Git | `~/.gitconfig`, `~/.gitignore` |
| `sheldon/` | Sheldon (Zsh plugin manager) | `~/.config/sheldon/plugins.toml` |
| `starship/` | Starship prompt | `~/.config/starship.toml` |
| `vim/` | Vim/Neovim | `~/.config/nvim/` |
| `hammerspoon/` | Hammerspoon (macOS only) | `~/.hammerspoon/` |
| `ai-agents/` | Claude Code / Codex | `~/.claude/` |

### AI agent setup

`ai-agents/MASTER-AGENTS.md` is the source of truth for Claude instructions, symlinked to `~/.claude/CLAUDE.md`. Editing this file affects all future Claude Code sessions. `ai-agents/claude/settings.json` controls tool permissions (allowed/denied/ask).

### Cross-platform notes

- macOS: uses Homebrew (`Brewfile`)
- Linux: uses APT (`apt_packages.txt`) or optionally Homebrew (`Brewfile.filtered`)
- WSL-specific overrides go in `~/.zshrc.local` and `~/.gitconfig.local` (see `*.wsl.sample` files for templates)

### Version management

Mise (formerly RTX) manages language runtime versions. Configuration lives in `.mise.toml` files per project (not in this repo). Sheldon manages Zsh plugins via `sheldon/plugins.toml`.
