-- lua/plugins/tmux.lua
-- tmux連携（tmux使用時のみ）

return {
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Navigate left" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Navigate down" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Navigate up" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Navigate right" },
    },
  },
}
