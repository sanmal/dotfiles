-- init.lua - Neovim設定エントリーポイント

-- グローバルリーダーキーの設定（lazy.nvim読み込み前に必須）
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 基本設定の読み込み
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- lazy.nvim ブートストラップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim セットアップ
require("lazy").setup({
  spec = {
    -- プラグイン定義を lua/plugins/ から読み込み
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- デフォルトで即時読み込み
    version = false, -- 常に最新コミットを使用
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  checker = {
    enabled = true, -- 自動アップデートチェック
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
