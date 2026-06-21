local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap = true, buffer = ev.buf, silent = true }

    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
    -- keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
    keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts)

    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts) -- jump to previous diagnostic in buffer
    --
    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts) -- jump to next diagnostic in buffer


    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

