-- lua/plugins/treesitter.lua
-- tree sitter highlighting settings
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "bash",
        "markdown", "vim",
      },
      indent = {
	enable = true
      },
      highlight = {
        enable = true
      },
    })
  end,
}
