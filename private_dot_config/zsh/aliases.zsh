# ~/.config/zsh/aliases.zsh
# コマンドの動作を常時変更する alias のみ置く
# タイプ節約目的のものは abbreviations.zsh へ

# ===== ls 系（色付けの常時適用 + バリアント） =====
alias ls='ls --color=auto'
alias ll='ls -alFh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias lsd='ls -d */ --color=auto'

# ===== 破壊的操作の安全ガード =====
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ===== 色付け・human-readable 常時適用 =====
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# ===== エディタ置換 =====
alias vi='nvim'
alias vim='nvim'

# ===== Debian/Ubuntu のパッケージ名吸収 =====
alias bat='batcat'
# alias cat='batcat --paging=never'  # 本当のcatを残したい派なら無効のまま

# ===== ディレクトリ移動（記号aliasはabbrトリガに馴染まないためaliasで） =====
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'
