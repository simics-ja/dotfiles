#!/bin/sh
input=$(cat)

if ! command -v jq > /dev/null 2>&1; then
  exit 0
fi

ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0 | floor')
rate_5h=$(echo "$input" | jq -r 'if .rate_limits.five_hour.used_percentage != null then (.rate_limits.five_hour.used_percentage | floor | tostring) + "%" else null end')
rate_7d=$(echo "$input" | jq -r 'if .rate_limits.seven_day.used_percentage != null then (.rate_limits.seven_day.used_percentage | floor | tostring) + "%" else null end')
model=$(echo "$input" | jq -r '.model.display_name // ""')
cwd=$(echo "$input" | jq -r '.cwd // "."')
dirname=$(basename "$cwd")
branch=$(git -C "$cwd" branch --show-current 2>/dev/null)

RED='\033[31m'
YEL='\033[33m'
GRN='\033[32m'
DIM='\033[2m'
RST='\033[0m'

pct_color() {
  if [ "$1" -ge 80 ]; then printf '%s' "$RED"
  elif [ "$1" -ge 50 ]; then printf '%s' "$YEL"
  else printf '%s' "$GRN"
  fi
}

progress_bar() {
  pct=$1
  filled=$((pct / 10))
  empty=$((10 - filled))
  i=0; bar=""
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$((i + 1)); done
  i=0
  while [ $i -lt $empty ]; do bar="${bar}░"; i=$((i + 1)); done
  printf '%s' "$bar"
}

ctx_color=$(pct_color "$ctx_pct")
ctx_bar=$(progress_bar "$ctx_pct")
printf "${ctx_color}ctx $(progress_bar "$ctx_pct") ${ctx_pct}%%${RST}"

if [ "$rate_5h" != "null" ] || [ "$rate_7d" != "null" ]; then
  printf " ${DIM}│${RST} rate"
  [ "$rate_5h" != "null" ] && printf " 5h:${rate_5h}"
  [ "$rate_7d" != "null" ] && printf " 7d:${rate_7d}"
fi

if [ -n "$branch" ]; then
  printf " ${DIM}│${RST} ${branch}${GRN}@${RST}${dirname}"
fi

[ -n "$model" ] && printf " ${DIM}│${RST} ${model}"

printf '\n'
