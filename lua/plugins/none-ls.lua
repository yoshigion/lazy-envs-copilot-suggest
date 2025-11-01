-- lua/plugins/none-ls.lua
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- フォーマッタ
        null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
        null_ls.builtins.formatting.prettierd.with({ filetypes = { "javascript", "typescript", "json", "markdown" } }),
        null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),

        -- Linter
        null_ls.builtins.diagnostics.eslint_d.with({ filetypes = { "javascript", "typescript" } }),
        null_ls.builtins.diagnostics.shellcheck.with({ filetypes = { "sh", "bash", "zsh" } }),
        null_ls.builtins.diagnostics.flake8.with({
          filetypes = { "python" },
          condition = function(utils)
            return utils.root_has_file({ ".flake8", "setup.cfg", "pyproject.toml" })
          end,
        }),
      },
    })
  end,
}
