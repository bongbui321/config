return {
  "tpope/vim-fugitive",
  config = function()
    -- setup statusline bar to include branch name
    vim.o.statusline = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P %{FugitiveStatusline()}"
    vim.keymap.set("n", "<leader>G", ":vertical rightbelow Git<CR>")
  end
}
