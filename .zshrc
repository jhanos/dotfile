# git clone --bare https://git/dotfiles.git $HOME/.dotfiles/
# git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
bindkey -e


autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit; promptinit

USE_POWERLINE="true"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=~/.local/bin/:~/.bin/:~/node_modules/.bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib

for zshfile in "$HOME/.zshrc.d/"*.zsh; do
  source $zshfile
done
source <(kubectl completion zsh)
source <(zoxide init zsh)


# alias
alias ll='ls -l --color'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vi=nvim
alias k='kubectl'
alias cat='bat -P --style=plain'

export FZF_DEFAULT_COMMAND="find -L"
export FZF_DEFAULT_OPTS="-e"
