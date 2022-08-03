# Fig pre block. Keep at the top of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/profile.pre.bash" ]] && . "$HOME/.fig/shell/profile.pre.bash"
fi
# Fig post block. Keep at the bottom of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/profile.post.bash" ]] && . "$HOME/.fig/shell/profile.post.bash"
fi