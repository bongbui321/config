local servers = {
  "lua_ls",
  "pyright",
  "tsserver",
  "clangd",
  "pyright",
}

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {unpack(servers)}
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("bongbui321.handlers").on_attach,
	}

  server = vim.split(server, "@")[1]

	lspconfig[server].setup(opts)
end
