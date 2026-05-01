# ~/.config/zsh/functions.zsh
# シェル関数の置き場所

# ===== .zshrc リロード（環境変数の汚染を避けたい場合は exec zsh 推奨） =====
#function reload() {
#    source ~/.zshrc
#    echo "✓ .zshrc reloaded"
#}

# ===== cd 後に ls（デフォルト無効、必要なら有効化） =====
# function chpwd() {
#     ls -la --color=auto
# }

# ===== mkdir + cd =====
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ===== プロセスgrep（psの出力ヘッダ保持） =====
function psg() {
    ps aux | head -1
    ps aux | grep -v grep | grep -i "$@"
}
