vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- resize splits
vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")

-- quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cnext<CR>")

-- yank relative path of current buffer to clipboard
vim.keymap.set("n", "<leader>yr", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
end, { desc = "Yank relative path to clipboard" })
