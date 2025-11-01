-- plugins-setup.lua
-- lazy.nvim のセットアップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグイン定義
require("lazy").setup({
  { import = "plugins.lualine" },
  { import = "plugins.telescope" },
  { import = "plugins.nvim-tree" },
  -- 他のプラグインもここに import で追加
})
