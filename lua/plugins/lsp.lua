-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "bashls", "tsserver" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local keymap = vim.keymap.set
      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "gr", vim.lsp.buf.references, opts)
    end

    local servers = { "lua_ls", "pyright", "bashls", "tsserver" }

    for _, server in ipairs(servers) do
      if server == "lua_ls" then
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        })
      else
        lspconfig[server].setup({ on_attach = on_attach })
      end
    end
  end
}
