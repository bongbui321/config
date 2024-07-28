local servers = {
  "lua_ls",
  "pyright",
  "tsserver",
  "clangd",
}

require("mason").setup()
require("mason-lspconfig").setup {}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("bongbui321.lsp.handlers").on_attach,
	}

  -- server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "bongbui321.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

	lspconfig[server].setup(opts)
end
