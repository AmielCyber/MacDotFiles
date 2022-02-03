" Vim/Neovim Settings
set tabstop=4               " Number of spaces that a <Tab> in the file counts for
set softtabstop=4           " Number of spaces when pressing tab while performin edits
set shiftwidth=4            " Newline indentation
set expandtab               " Indents while going on insert
set smartindent             " Smart indent when starting a new line
set number                  " Show line numbers
set incsearch               " Highlight as you search
set colorcolumn=120         " Column marker at 120 characters
set signcolumn=yes          " Always have the column displayed
set nohlsearch              " stop highlighting after searching
set nowrap                  " No character wrapping when page width is exceeded
set hidden                  " Fast file swapping

" To be used with undofile Plugin
set noswapfile              " Dont use vim's swapfile system
set nobackup                " Dont use vim's backup file
set undofile                " Set undo file and be stored in the undo directory with our undodir plugin
" Undo directory where all the undo files will be stored at
set undodir=~/.config/nvim/undodir/ 

set scrolloff=10            " Keeps 10 lines of buffer from the top or bottom when scrolling
set termguicolors           " Get the sweet color support from the terminal
set mouse=nv                " Mouse support. Yikes! Sorry I know is a sin....

" Plugins
call plug#begin('~/.config/nvim/plugged')
    " Plugins required for language server protocol syntax highlighting 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}         " Language parser for color highlighting
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'                  " Location and syntax aware text objects
    Plug 'neovim/nvim-lspconfig'                                        " Neovim Language Server Protocol
    Plug 'williamboman/nvim-lsp-installer'                              " Easily install LSPs

    " Plugins required for using telescope
    Plug 'nvim-lua/plenary.nvim'                                        " Lua functions for Telescope
    Plug 'nvim-telescope/telescope.nvim'                                " Telescope for quick file finding within nvim
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }   " Telescope fuzzy finder
    Plug 'nvim-lua/popup.nvim'                                          " Pop up windows within nvim

    " Plugins required for snipped feature in nvim cmp
    Plug 'hrsh7th/cmp-vsnip'                                            " Use snipets within cmp enginge
    Plug 'hrsh7th/vim-vsnip'                                            " Snippet package
    Plug 'hrsh7th/vim-vsnip-integ'                                      " Snippet completion & expansion

    " Plugins required for the nvim-cmp completion engine
    Plug 'hrsh7th/cmp-nvim-lsp'                                         " Plugin for cmp to communicate with the LSP
    Plug 'hrsh7th/cmp-buffer'                                           " nvim-cmp source for buffer words
    Plug 'hrsh7th/cmp-path'                                             " For cmp to see the path directory
    Plug 'hrsh7th/cmp-nvim-lua'                                         " nvim-cmp source for neovim Lua API
    Plug 'hrsh7th/cmp-cmdline'                                          " nvim-cmp source for vim's cmdline
    Plug 'hrsh7th/nvim-cmp'                                             " The completion engine plugin

    Plug 'ray-x/lsp_signature.nvim'                                     " Class/Function signatures

    Plug 'kyazdani42/nvim-web-devicons'                                 " Icons to be used with other plugins
    Plug 'mfussenegger/nvim-jdtls'                                      " LSP java using eclipse's LSP
    Plug 'nvim-lualine/lualine.nvim'                                    " Status Line Display
    Plug 'mbbill/undotree'                                              " Undo tree plug in
    Plug 'sainnhe/sonokai'                                              " Colorscheme
call plug#end()

" Nvim cmp configuration settings
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- Language Server Protocol calls to communicate with nvm-cmp for text completion and suggestions
  -- Must install first with nvim-lsp-installer using command ':LspInstall language' in nvim
  -- C and C++ LSP only to Mac
  require('lspconfig')['clangd'].setup {
    -- Have our signature plugin attached
    capabilities = require "lsp_signature".setup({
        bind = true,
        handler_opts = {
        border = "rounded"
        }
    })
  }
  -- Python LSP
  require('lspconfig')['pylsp'].setup {
    -- Have our signature plugin attached
    capabilities = require "lsp_signature".setup({ 
        bind = true,
        handler_opts = {
        border = "rounded"
        }
    })
  }
  -- Javascript LSP
  require('lspconfig')['eslint'].setup {
    capabilities = require "lsp_signature".setup({
        bind = true, 
        handler_opts = {
        border = "rounded"
        }
    })
  }
  -- Java LSP must be configured first via the jdtls documentation
  require('lspconfig')['tsserver'].setup {
    -- Have our signature plugin attached
    capabilities = require "lsp_signature".setup({ 
        bind = true,
        handler_opts = {
        border = "rounded"
        }
    })
  }
  -- signature configure
EOF

" Tree sitter lua configuration to enable text highlighting
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Lua status line configuration
lua << END
require'lualine'.setup {
  options = {
    -- use sonokai theme
    theme = 'sonokai'
  }
}
END

let mapleader = " "         " Hot key to use with plugins or custom key mappings
" Using Lua functions
" Telescope remmaps hotkeys
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Colorscheme settings for neovim
" sonokai_style: atlantis, andromeda, shusia, default, maia, espresso
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" Window settings
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Window key mappings move window location
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Key mapping for undo tree
nnoremap <leader>u :UndotreeShow<CR>
" Window key mapping for opening a new window
nnoremap <leader>pv :wincmd v<bar> :Ex<bar> :vertical resize 30<CR>
" Window key mapping for resizing a window
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
