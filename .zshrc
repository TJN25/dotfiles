source ~/.config/dotfiles/bash_alias
source ~/.config/dotfiles/bash_paths
source ~/.config/dotfiles/my_zsh_profile

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- autosuggestions ---
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4c566a,bold,underline"

eval "$(zoxide init zsh)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/nicth99p/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
unset ZSH_AUTOSUGGEST_USE_ASYNC
export PATH=/Users/nicth99p/edirect:${PATH}
eval "$(atuin init zsh)"

# pixi
export PATH=/Users/nicth99p/.pixi/bin:$PATH
eval "$(pixi completion --shell zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
