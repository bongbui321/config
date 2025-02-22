local M = {}

local status_cmp_ok, _ = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	print("Error: cmp_nvim_lsp not found")
	return
end

local status_telescope_builtin, builtin = pcall(require, "telescope.builtin")
if not status_telescope_builtin then
	print("Error: telescope.builtin not found")
  return
end

local function lsp_keymaps(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- these 2 are used with telescope.builtin
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

  -- telescope.builtin
	vim.keymap.set("n", "gd", builtin.lsp_definitions, bufopts)
	vim.keymap.set("n", "gr", builtin.lsp_references, bufopts)
	vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, bufopts)
	vim.keymap.set("n", "<leader>dn", builtin.diagnostics, bufopts)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local disable_fmt = { "pyright", "lua_ls" }
M.on_attach = function(client, bufnr)
  if vim.tbl_contains(disable_fmt, client.name) then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)

	local status_illuminate, illuminate = pcall(require, "illuminate")
	if not status_illuminate then
		return
	end

	illuminate.on_attach(client)
end

return M
