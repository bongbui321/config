local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- TODO: lsp stuff can be in one file
vim.api.nvim_create_autocmd('LspAttach', {
  -- group = vim.api.nvim_create_autogroup('bongbui321-lsp-attach', { clear = true }),

  callback = function(event)
    local map = function(keys, func)
      vim.keymap.set('n', keys, func, { buffer = event.buf })
    end

    map('gd', builtin.lsp_definitions)
    map('gr', builtin.lsp_references)
    map('<leader>ds', builtin.lsp_document_symbols)
  end
})
