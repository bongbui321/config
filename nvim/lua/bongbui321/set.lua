vim.o.syntax = 'on'
vim.o.laststatus = 2

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
--vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.cmd('highlight ColorColumn ctermbg=red')
vim.opt.colorcolumn = "160"

vim.opt.hlsearch = false
vim.opt.incsearch = true

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
