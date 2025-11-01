-- lua/config/autocmds.lua
local group = vim.api.nvim_create_augroup("MyAutoCmds", { clear = true })

-- 保存時に自動でフォーマット
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
