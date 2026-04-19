-- lua/plugins/git.lua
-- Git連携

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    -- デフォルトで:
    -- 行の変更マーク（追加/変更/削除）がsigncolumnに表示
    -- ]c / [c: 次/前のhunkへ移動
    -- <leader>hp: hunkプレビュー
    -- <leader>hs: hunkステージ
    -- <leader>hr: hunkリセット
  },
}
