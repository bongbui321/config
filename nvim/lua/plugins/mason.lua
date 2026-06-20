return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "clangd",
    },
  },
  dependencies = {
    { "williamboman/mason.nvim", opts = {}, },
    "neovim/nvim-lspconfig",
  },
}
