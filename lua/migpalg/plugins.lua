-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 'rose-pine/neovim', as = 'rose-pine' })

	vim.cmd('colorscheme rose-pine')

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'vonheikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- lsp support
			{'neovim/nvim-lspconfig'},             -- required
			{                                      -- optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'masonupdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- optional

		-- autocompletion
		{'hrsh7th/nvim-cmp'},     -- required
		{'hrsh7th/cmp-nvim-lsp'}, -- required
		{'l3mon4d3/luasnip'},     -- required
	};

    use('sbdchd/neoformat');

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
}
end)
