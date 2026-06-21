return {
  'theprimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>a',
      function()
        require('harpoon.mark').add_file()
      end,
      desc = 'Harpoon add file',
    },
    { '<C-e>',
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      desc = 'Harpoon menu',
    },
  }
}
