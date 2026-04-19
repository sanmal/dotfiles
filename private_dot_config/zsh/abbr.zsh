# ~/.config/zsh/abbr.zsh
# 自前abbr実装: スペース/Enterで直前の単語を辞書で引き、一致すれば展開する
# 
# 使い方:
#   abbr gs 'git status -sb'
#   abbr gc 'git commit'
#   abbr ll 'ls -alFh'    # aliasとの共存も可能（abbrが先に展開される）
#
# 展開を抑止してスペースを入れたい場合: Ctrl+X Space
# abbr一覧表示: abbr-list
# abbr削除:     abbr-unset <name>

typeset -gA ZSH_ABBREVIATIONS

# abbr 登録: abbr <key> <expansion>
abbr() {
    if (( $# < 2 )); then
        echo "usage: abbr <key> <expansion>" >&2
        return 1
    fi
    local key="$1"
    shift
    ZSH_ABBREVIATIONS[$key]="$*"
}

# abbr 一覧表示
abbr-list() {
    local k
    for k in "${(@k)ZSH_ABBREVIATIONS}"; do
        printf "%-10s => %s\n" "$k" "${ZSH_ABBREVIATIONS[$k]}"
    done | sort
}

# abbr 削除
abbr-unset() {
    unset "ZSH_ABBREVIATIONS[$1]"
}

# 展開ロジック本体: LBUFFER末尾の単語を辞書で引く
_zsh_abbr_expand() {
    emulate -L zsh
    # 行頭または直前が空白の、連続する非空白文字を取得
    local word="${LBUFFER##*[[:space:]]}"
    [[ -z "$word" ]] && return
    local expansion="${ZSH_ABBREVIATIONS[$word]}"
    if [[ -n "$expansion" ]]; then
        LBUFFER="${LBUFFER%$word}$expansion"
    fi
}

# Space 押下時: 展開してからスペース挿入
_zsh_abbr_expand_and_space() {
    _zsh_abbr_expand
    zle self-insert
}
zle -N _zsh_abbr_expand_and_space

# Enter 押下時: 展開してからコマンド実行
_zsh_abbr_expand_and_accept() {
    _zsh_abbr_expand
    zle accept-line
}
zle -N _zsh_abbr_expand_and_accept

# 展開を抑止してスペースを入れたい場合に使う
_zsh_abbr_no_expand_space() {
    LBUFFER+=' '
}
zle -N _zsh_abbr_no_expand_space

# キーバインド（viinsモード・通常モード両方に登録）
bindkey -M viins ' '    _zsh_abbr_expand_and_space
bindkey -M viins '^M'   _zsh_abbr_expand_and_accept
bindkey -M viins '^X '  _zsh_abbr_no_expand_space
bindkey -M emacs ' '    _zsh_abbr_expand_and_space
bindkey -M emacs '^M'   _zsh_abbr_expand_and_accept
bindkey -M emacs '^X '  _zsh_abbr_no_expand_space
