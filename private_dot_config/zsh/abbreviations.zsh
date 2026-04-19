# ~/.config/zsh/abbreviations.zsh
# タイプ節約+実コマンド可視化したいものは abbr で
# スペース/Enter 押下時に展開される（abbr.zsh 参照）

# ===== Git（gitも併用するため最小限を残す） =====
abbr g   'git'
abbr gs  'git status -sb'
abbr ga  'git add'
abbr gc  'git commit -m "%"'
abbr gp  'git push'
abbr gl  'git log --oneline -20'
abbr gd  'git diff'
abbr gco 'git checkout'
abbr gb  'git branch'

# ===== Jujutsu（メインVCS） =====
abbr j   'jj'
abbr js  'jj status'
abbr jl  'jj log'
abbr jll 'jj log --limit 20'
abbr jd  'jj diff'
abbr jn  'jj new'
abbr jc  'jj commit -m "%"'
abbr je  'jj edit'
abbr jsq 'jj squash'
abbr jsp 'jj split'
abbr jr  'jj rebase'
# jj git サブコマンド族
abbr jg  'jj git'
abbr jgp 'jj git push'
abbr jgf 'jj git fetch'

# ===== システム・ネットワーク（滅多に使わない=実コマンド思い出したい） =====
abbr ports 'ss -tulanp'
abbr myip  'curl -s ifconfig.me'
abbr dfi   'df -hT'

# ===== Pop!_OS / apt =====
abbr update  'sudo apt update && sudo apt upgrade'
abbr install 'sudo apt install'
# ※ 注: 'search' は一般的すぎるので避ける。aptsで代替
abbr aptsr   'apt search'
abbr aptsh   'apt show'

# ===== tmux =====
abbr ta  'tmux attach'
abbr tl  'tmux list-sessions'
abbr tn  'tmux new -s'
abbr tk  'tmux kill-session -t'

# ===== mise（ツールバージョン管理） =====
abbr mls 'mise ls'
abbr mu  'mise use'
abbr mi  'mise install'

# ===== chezmoi（dotfile管理） =====
abbr cz   'chezmoi'
abbr cze  'chezmoi edit ~/%'
abbr czd  'chezmoi diff'
abbr czap 'chezmoi apply'
abbr czcd 'chezmoi cd'

# ===== よく使うシステムコマンド =====
abbr reload 'exec zsh'   # reload 関数より軽量な再起動
