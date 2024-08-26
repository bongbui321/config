vim.o.syntax = 'on'
vim.o.laststatus = 2

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.smartindent = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true --insert spaces rather than tab if set to true

vim.cmd('highlight ColorColumn ctermbg=red')
vim.opt.colorcolumn = "160"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

-- trailing whitespace
vim.cmd([[
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
]])

-- auto resize all windows
vim.cmd([[
  autocmd VimResized * wincmd =
]])

vim.g.mapleader = " "

vim.filetype.add({
  filename = {
    ['SConstruct'] = 'python',
    ['SConscript'] = 'python',
  },
})

-- autoreload when change on files on disk
vim.opt.ut = 50
vim.opt.autoread = true

-- NOTES: These requires a lot of energy. User `:checktime` instead
--vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
--  command = "if mode() != 'c' | checktime | endif",
--  pattern = { "*" },
--})

