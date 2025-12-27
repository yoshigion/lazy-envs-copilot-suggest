-- lua/config/options.lua
-- disable mouse
vim.opt.mouse = "" -- disable mouse

-- specify python under pyenv
vim.g.python3_host_prog = "~/.pyenv/versions/3.12.11/bin/python"
-- specify ruby under rbenv
vim.g.ruby_host_prog = "~/.rbenv/versions/3.4.7/bin/ruby"
-- disable perl provider
vim.g.loaded_perl_provider = 0

---- nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

---- <leader>キーをバックスラッシュからスペースに変更する
vim.g.mapleader = " "
