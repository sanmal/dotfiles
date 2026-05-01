# ~/.config/zsh/abbreviations.zsh
# タイプ節約+実コマンド可視化したいものは abbr で
# スペース/Enter 押下時に展開される（abbr.zsh 参照）

# ===== systemctl =====
abbr sc    'systemctl'
abbr scs   'systemctl status'
abbr scr   'sudo systemctl restart'
abbr jctl  'journalctl'
abbr jctlu 'journalctl -u %'
abbr jctlf 'journalctl -fu %'

# ===== Git =====
abbr g   'git'
abbr gs  'git status -sb'
abbr ga  'git add'
abbr gc  'git commit -m "%"'
abbr gp  'git push'
abbr gl  'git log --oneline -20'
abbr gd  'git diff'
abbr gco 'git checkout'
abbr gb  'git branch'

# ===== Jujutsu =====
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
abbr jbm 'jj bookmark set main -r @-'
# jj git サブコマンド
abbr jg  'jj git'
abbr jgp 'jj git push'
abbr jgf 'jj git fetch'

# ===== システム・ネットワーク =====
abbr psa   'ps aux'
abbr psal  'ps aux | less %'
abbr ports 'ss -tulanp'
abbr myip  'curl -s ifconfig.me'
abbr dfi   'df -hT'
abbr seds  "sed 's|%||'"
abbr awk1  "awk '{print $1}'"
abbr less  '| less'
abbr head  '| head -%'

# =====  apt =====
abbr updugr  'sudo apt update && sudo apt upgrade -y'
abbr install 'sudo apt install'
abbr aptsr   'apt search'
abbr aptsh   'apt show'

# ===== tmux =====
abbr ta  'tmux attach'
abbr tl  'tmux list-sessions'
abbr tn  'tmux new -s'
abbr tk  'tmux kill-session -t'

# ===== mise =====
abbr mls 'mise ls'
abbr mu  'mise use'
abbr mi  'mise install'

# ===== chezmoi =====
abbr cz   'chezmoi'
abbr cze  'chezmoi edit ~/%'
abbr czd  'chezmoi diff'
abbr czap 'chezmoi apply'
abbr czcd 'chezmoi cd'

# ===== tar =====
abbr tarx  'tar -zxvf'
abbr tarc  'tar -zcvf'
abbr untar 'tar -xvf'

# ===== cargo =====
# 'cc'はgccと重なるので使用不可
abbr c   'cargo'
abbr cb  'cargo build'
abbr cr  'cargo run'
abbr ct  'cargo test'
abbr cch 'cargo check'
abbr ccl 'cargo clipy'
abbr cf  'cargo fmt'
abbr ca  'cargo add %'

# ===== システムコマンド =====
abbr abls   'abbr-list'
abbr reload 'exec zsh'   # reload 関数より軽量な再起動
