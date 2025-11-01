-- plugins-setup.lua
-- lazy.nvim のセットアップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグイン定義
require("lazy").setup({
  spec = {
    { import = "plugins" },  -- lua/plugins/ ディレクトリを自動読み込み
  },
  defaults = {
    lazy = false,            -- デフォルトで即ロード
    version = false,         -- バージョン固定しない（最新を使う）
  },
  --install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- 自動アップデートチェック
})
