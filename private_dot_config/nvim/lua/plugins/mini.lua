-- lua/plugins/mini.lua
-- mini.nvim: 軽量なモジュラープラグイン集

return {
  -- mini.files: ファイルエクスプローラー
  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    opts = {},  -- デフォルト設定で使用
  },
}
