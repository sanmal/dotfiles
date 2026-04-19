-- lua/plugins/colorscheme.lua
-- nightfox.nvim: 6種類のカラースキームを含むテーマ
-- デフォルトで使用可能: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfox")
      -- 他のバリエーション:
      -- vim.cmd.colorscheme("carbonfox")  -- ダーク、コントラスト高め
      -- vim.cmd.colorscheme("nordfox")    -- Nord風
      -- vim.cmd.colorscheme("duskfox")    -- 暖色系ダーク
    end,
  },
}
