
call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" TODO replace (archived)
Plug 'feline-nvim/feline.nvim' " Status bar

Plug 'christoomey/vim-tmux-navigator'

Plug 'github/copilot.vim', {'branch': 'release'}

" File viewer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-fugitive' " Git
Plug 'lewis6991/gitsigns.nvim' " Git signs

Plug 'tpope/vim-surround' " add, change, delete surroundings

" Use lsp for code completion, maybe use coc for auto formatting on save
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion

" Plug 'dense-analysis/ale', {'for': ['rust','go','python','javascript','typescript','latex']} " Async Lint Engine

Plug 'tomlion/vim-solidity'
Plug 'norcalli/nvim-colorizer.lua'
Plug '0xhyoga/starknet-vim'

Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'lukas-reineke/lsp-format.nvim'

Plug 'rcarriga/nvim-notify' " Visual notifications

Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'

" Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

let g:copilot_enabled = v:false

lua << EOF
require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true,
    integrations = {
        cmp = true,
        notify = true,
        nvimtree = true,
        treesitter = true
    },
})
vim.cmd.colorscheme "catppuccin"

local ctp_feline = require('catppuccin.groups.integrations.feline')
ctp_feline.setup {}
require("feline").setup({
    components = ctp_feline.get(),
})

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>gs', gs.stage_hunk)
    map('n', '<leader>gr', gs.reset_hunk)
    map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    map('n', '<leader>gb', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

require("nvim-tree").setup {}

require("nvim-treesitter").setup {
    ensure_installed = {
        'vim',
        'lua',
        'solidity',
        'javascript',
        'typescript',
        'python',
        'rust'
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

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

require("mason").setup()
require("lsp-format").setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig").rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = cmp.on_attach,
}
require("lspconfig").pylsp.setup {
	capabilities = capabilities,
	on_attach = cmp.on_attach,
}
require("lspconfig").tsserver.setup {
	capabilities = capabilities,
}
require("lspconfig").tailwindcss.setup {
	capabilities = capabilities,
	on_attach = cmp.on_attach,
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

local util = require 'lspconfig.util'
require('lspconfig.configs').cairo_language_server = {
  default_config = {
    name = 'cairo-language-server',
    cmd = {'cairo-language-server'},
    filetypes = {'cairo'},
    root_dir = function(fname)
       return util.root_pattern 'Scarb.toml'(fname)
         or util.root_pattern('Scarb.toml', 'cairo_project.toml', '.git')(fname)
     end,
    }
}
require('lspconfig').cairo_language_server.setup({})

lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})
EOF
