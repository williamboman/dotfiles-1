# More fzf widgets
# ================

# This script should be sourced AFTER fzf.zsh
# @seealso ~/.fzf/shell/key-bindings.zsh for fzf mappings (Ctrl-T, Alt-C, Ctrl-R, etc.)

# More Shortcuts
bindkey '^ ' fzf-file-widget          # Ctrl-SPACE, Ctrl-T

() { return;

# CTRL-V: fill 'vim ...' command with fzf select
zle      -N   fzf-vimfile-widget
bindkey  '^V' fzf-vimfile-widget
fzf-vimfile-widget() {
  if [[ -n "$LBUFFER" && "$LBUFFER" != "vim " ]]; then
    return 1   # works only if the cmdline is empty
  fi
  LBUFFER="vim "
  zle reset-prompt
  selected="$(__fsel --prompt "vim> ")"
  if [[ -n "$selected" ]]; then
    ; #eval "vim ${selected[@]}"
  fi
  local ret=$?
  LBUFFER="vim ${selected}"
  zle reset-prompt
  return $ret
}

}
