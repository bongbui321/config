-- return {
--   {
--     "chriskempson/base16-vim",
--     priority = 1000,
--     lazy = false,
--     config = function()
--       vim.opt.termguicolors = true
--       vim.cmd("colorscheme base16-default-dark")
--     end,
--   },
-- }

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000 ,
  opts = {
    terminal_colors = true,
    contrast = "dark",
  },
  config = function()
    vim.opt.termguicolors = true
    vim.cmd("colorscheme gruvbox")
  end,
}
