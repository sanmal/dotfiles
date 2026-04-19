-- lua/plugins/ui.lua
-- UI改善プラグイン

return {
  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},  -- デフォルトテーマはautoで環境に合わせる
  },

  -- キーマップヘルプ
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    -- <leader>を押して少し待つとキーマップ一覧が表示される
  },

  -- インデントガイド
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {},
  },
}
