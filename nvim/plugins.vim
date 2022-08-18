
call plug#begin()
Plug 'github/copilot.vim', {'branch': 'release'} " Auto completion
" File viewer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting

Plug 'nvim-lualine/lualine.nvim' " Line
Plug 'junegunn/seoul256.vim' " Theme

Plug 'tpope/vim-fugitive' " Git
Plug 'mhinz/vim-signify' " Git status line
Plug 'tpope/vim-surround' " add, change, delete surroundings

" Use lsp for code completion, maybe use coc for auto formatting on save
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion

" Plug 'dense-analysis/ale', {'for': ['rust','go','python','javascript','typescript','latex']} " Async Lint Engine

Plug 'tomlion/vim-solidity'

Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'lukas-reineke/lsp-format.nvim'

Plug 'rcarriga/nvim-notify' " Visual notifications
call plug#end()

let g:seoul256_background = 237
colo seoul256

lua << EOF
require("nvim-tree").setup {}
require("lualine").setup {}
local cmp = require("cmp")
cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
			-- require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
	}),
	sources = {
		{ name = 'nvim_lsp', max_item_count = 10 },
		{ name = 'luasnip', max_item_count = 10 },
		{ name = 'buffer', max_item_count = 10 }
	},
	formatting = {
		format = require('lspkind').cmp_format({ with_text = false, maxwidth = 50 })
	},
	completion = { keyword_length = 1 }
}
require("nvim-lsp-installer").setup {}
require("lsp-format").setup {}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig").tsserver.setup {
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach
}
require("lspconfig").tailwindcss.setup {
	on_attach = cmp.on_attach,
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
		experimental = {
		classRegex = {
			"(?:\\bclass(?:Name)?\\s*=\\s*[\\\"\\']([_a-zA-Z0-9\\s\\-\\:\\/]+)[\\\"\\'])",
			"(?:\\btw\\s*`([_a-zA-Z0-9\\s\\-\\:\\/]*)`)"
		}
		}
		}
	}
}
EOF
