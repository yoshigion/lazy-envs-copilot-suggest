-- lua/plugins/none-ls.lua
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- フォーマッタ
        null_ls.builtins.formatting.stylua,       -- Lua 用
        null_ls.builtins.formatting.prettierd,    -- JS/TS/JSON/Markdown 用
        null_ls.builtins.formatting.shfmt,        -- Shell 用

        -- リンタ
        null_ls.builtins.diagnostics.eslint_d,    -- JS/TS 用
        null_ls.builtins.diagnostics.shellcheck,  -- Shell 用
      },
      on_attach = function(client, bufnr)
        -- LSP と同じように keymap を設定可能
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local map = vim.keymap.set
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
