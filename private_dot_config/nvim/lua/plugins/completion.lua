-- lua/plugins/completion.lua
-- 補完エンジン (blink.cmp)

return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      -- デフォルトキーマップ:
      -- <C-space>: 補完メニュー表示
      -- <C-e>: キャンセル
      -- <C-y> or <CR>: 確定
      -- <C-n>/<C-p> or <Tab>/<S-Tab>: 選択移動
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
