-- lua/config/options.lua
-- disable mouse
vim.opt.mouse="" -- disable mouse

-- specify python under pyenv
vim.g.python3_host_prog = '~/.pyenv/versions/3.12.11/bin/python'
-- specify ruby under rbenv
vim.g.ruby_host_prog = '~/.rbenv/versions/3.4.7/bin/ruby'
-- disable perl provider
vim.g.loaded_perl_provider = 0
