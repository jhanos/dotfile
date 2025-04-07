# sudo apt install docker default-jre zsh python3-venv sqlite
# echo "%sudo   ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/sudo
# sudo usermod -G sudo jhanos
# curl -OL https://github.com/zyedidia/eget/releases/download/v1.3.1/eget-1.3.1-linux_amd64.tar.gz && tar -xzf eget-1.3.1-linux_amd64.tar.gz
# ./eget-1.3.1-linux_amd64/eget -D
# git clone --bare https://git/dotfiles.git $HOME/.dotfiles/
# git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k


# ssh agent fowarding
[[ -e /tmp/ssh-agent ]] || [[ -f "/tmp/ssh-*/*" ]] && ln -f -s /tmp/ssh-*/* /tmp/sshAgent > /dev/null 2>&1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source ~/.powerlevel10k/powerlevel10k.zsh-theme
source <(kubectl completion zsh)
source <(zoxide init zsh)


export SSH_AUTH_SOCK=/tmp/sshAgent

# alias
alias ll='ls -l --color'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vi=nvim
alias s='ssh bastion'
alias k='kubectl'
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse; print(urllib.parse.unquote_plus(sys.argv[1]))"'
alias cat='bat -P --style=plain'
alias icat='kitten icat'
alias ani='ani-cli -q 480p'


function m {
  python3 -c "from math import *; print($*)"
}

function ks {
  kubectl config set-context --current --namespace=$(kubectl get --no-headers=true ns | tac | fzf | awk '{print $1}')
}

function pdfresize {
  filename=$(basename $1 | sed 's/.pdf//g')
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$filename-low.pdf $1
}


export FZF_DEFAULT_COMMAND="find -L"
export FZF_DEFAULT_OPTS="-e"
