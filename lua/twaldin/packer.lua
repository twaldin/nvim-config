-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself

	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({ 'rose-pine/neovim', as = 'rose-pine' })

	vim.cmd('colorscheme rose-pine')
	use{
		'nvim-treesitter/nvim-treesitter',
		{run = ':TSUpdate'}
	}
	use{'nvim-treesitter/playground'}
	use{'theprimeagen/harpoon'}
	use{"mbbill/undotree"}
	use{"tpope/vim-fugitive"}
	use 'neovim/nvim-lspconfig'

	-- Optional: for better completion experience
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'        -- Optional: buffer completions
	use 'hrsh7th/cmp-path'          -- Optional: path completions
	use 'L3MON4D3/LuaSnip'          -- Optional: snippet engine
	use 'saadparwaiz1/cmp_luasnip'  -- Optional: snippet completions
    use 'theprimeagen/vim-be-good'
end)  
