-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function ()
      vim.cmd('colorscheme tokyonight-night')
    end
    })

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
end)
