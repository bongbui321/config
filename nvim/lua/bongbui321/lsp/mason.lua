local servers = {
  --"lua_ls",
  "pyright",
  "tsserver",
  "clangd",
  "rust_analyzer"
}

require("mason").setup()
require("mason-lspconfig").setup {}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {
  ensured_installed = servers
}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("bongbui321.lsp.handlers").on_attach,
	}

  local require_ok, conf_opts = pcall(require, "bongbui321.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

	lspconfig[server].setup(opts)
end
