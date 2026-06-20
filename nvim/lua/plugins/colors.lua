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
  priority = 1000,
  lazy = false,
  opts = {
    terminal_colors = false,
    contrast = "",
  },
  config = function(_, opts)
    vim.opt.termguicolors = true
    require("gruvbox").setup(opts)
    vim.cmd("colorscheme gruvbox")
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
