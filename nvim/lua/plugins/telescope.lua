return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Find git files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },
    {
      '<leader>fl',
      function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })
      end,
      desc = 'Grep prompt',
    },
  },
}
