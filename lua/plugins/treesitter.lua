-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "bash",
        "markdown", "vim",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
