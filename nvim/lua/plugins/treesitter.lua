return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = { "c", "cpp", "lua", "markdown", "markdown_inline", "python" },
    auto_install = false,
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
