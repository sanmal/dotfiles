# ~/.config/zsh/abbr.zsh
# 自前abbr実装: スペース/Enterで直前の単語を辞書で引き、一致すれば展開する
#
# 使い方:
#   abbr gs 'git status -sb'
#   abbr gc 'git commit'
#   abbr jc 'jj commit -m "%"'   # % の位置にカーソルが移動する
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
# 戻り値: 0=展開した, 1=展開しなかった
# 展開時に % マーカーがあれば _zsh_abbr_cursor_target にその位置を記録する
typeset -gi _zsh_abbr_cursor_target=-1

_zsh_abbr_expand() {
    emulate -L zsh
    _zsh_abbr_cursor_target=-1

    # 行頭または直前が空白の、連続する非空白文字を取得
    local word="${LBUFFER##*[[:space:]]}"
    [[ -z "$word" ]] && return 1
    local expansion="${ZSH_ABBREVIATIONS[$word]}"
    [[ -z "$expansion" ]] && return 1

    # 展開を適用
    LBUFFER="${LBUFFER%$word}$expansion"

    # カーソル位置マーカー処理
    if [[ $BUFFER == *%* ]]; then
        # \% をプレースホルダに退避（% リテラルを保護）
        BUFFER="${BUFFER//\\%/$'\x01'}"
        local pos=${BUFFER[(i)%]}
        BUFFER="${BUFFER[1,pos-1]}${BUFFER[pos+1,-1]}"
        # プレースホルダを % に復元
        BUFFER="${BUFFER//$'\x01'/%}"
        _zsh_abbr_cursor_target=$((pos - 1))
    fi

    return 0
}

# Space 押下時: 展開してからスペース挿入
# マーカーがあればカーソルを移動し、スペース挿入はスキップする
_zsh_abbr_expand_and_space() {
    _zsh_abbr_expand
    if (( _zsh_abbr_cursor_target >= 0 )); then
        CURSOR=$_zsh_abbr_cursor_target
    else
        zle self-insert
    fi
}
zle -N _zsh_abbr_expand_and_space

# Enter 押下時: 展開してからコマンド実行
# マーカーがあればカーソルを移動し、実行はしない（入力を続けさせる）
_zsh_abbr_expand_and_accept() {
    _zsh_abbr_expand
    if (( _zsh_abbr_cursor_target >= 0 )); then
        CURSOR=$_zsh_abbr_cursor_target
    else
        zle accept-line
    fi
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
