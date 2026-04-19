-- lua/plugins/editor.lua
-- エディタ拡張

return {
  -- 括弧自動補完
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- コメント操作
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle line" },
      { "gc", mode = { "n", "v" }, desc = "Comment toggle" },
    },
    opts = {},
    -- gcc: 行コメント切替
    -- gc + motion: 範囲コメント切替 (例: gcip = 段落コメント)
    -- ビジュアル選択 + gc: 選択範囲コメント切替
  },

  -- 囲み操作 (surround)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
    -- ys{motion}{char}: 追加 (例: ysiw" = 単語を""で囲む)
    -- ds{char}: 削除 (例: ds" = ""を削除)
    -- cs{old}{new}: 変更 (例: cs"' = ""を''に変更)
  },
}
