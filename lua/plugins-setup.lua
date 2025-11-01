-- lazy.lua
-- Lazy.nvim の初期化とプラグイン定義
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.lualine" },
  { import = "plugins.telescope" },
  { import = "plugins.nvim-tree" },
  -- 他のプラグインもここに import で追加
})
