-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Comment plugins and its deps
  use({
    "folke/todo-comments.nvim",
		requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('todo-comments').setup {}
    end
  })

	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')

  use('tpope/vim-fugitive')

	-- Colorscheme
	-- use("folke/tokyonight.nvim")
  use ({
    "catppuccin/nvim", as = "catppuccin"
  })

  -- Markdown preview
  -- cd ~/.local/share/nvim/site/pack/packer/start/
  -- git clone https://github.com/iamcco/markdown-preview.nvim.git
  -- cd markdown-preview.nvim
  -- npx --yes yarn install
  -- npx --yes yarn build
	--
	-- TODO: Use this instead: https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file
  use("iamcco/markdown-preview.nvim")

  use("RRethy/vim-illuminate")
end)
