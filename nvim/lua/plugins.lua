return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }    -- Language parser for color highlighting
    use 'nvim-treesitter/nvim-treesitter-textobjects'               -- Location and syntax aware text objects
    use { "williamboman/mason.nvim", 
        "williamboman/mason-lspconfig.nvim", 
        "neovim/nvim-lspconfig",
    }                                                               -- LSP Config
    use "jose-elias-alvarez/null-ls.nvim"                           -- LSP Linter
    
    -- Telescope Dependencies
    use {'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    }                                                               -- Fuzzy Finder Req for telescope
    use 'nvim-lua/plenary.nvim'
    -- Optional Dependencies
    use 'kyazdani42/nvim-web-devicons'                              -- Icons for snippets and telescope
    -- Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

    -- Plugins required for the nvim-cmp completion engine (LSP Auto Completer)
    use 'hrsh7th/cmp-nvim-lsp'                                      -- Plugin for cmp to communicate with the lsp
    use 'hrsh7th/cmp-buffer'                                        -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-path'                                          -- Auto directory path completer
    use 'hrsh7th/cmp-nvim-lua'                                      -- Lua auto completer
    use 'hrsh7th/cmp-cmdline'                                       -- Nvim-cmp source for vim's cmdline
    -- Required Snips for nvim cmp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- Optional Snips
    use "rafamadriz/friendly-snippets"
    use "ray-x/lsp_signature.nvim"
    use "onsails/lspkind.nvim"
    -- The completion engine plugin
    use 'hrsh7th/nvim-cmp'                                          

	-- colorscheme
	use 'folke/tokyonight.nvim'
    use 'sainnhe/everforest'
    use 'cpea2506/one_monokai.nvim'

    -- All other Plugins
    use 'nvim-lualine/lualine.nvim'                                 -- Status Line Display
    use 'mbbill/undotree'                                           -- Undo tree plug-in
    use "windwp/nvim-autopairs"                                     -- Auto pairs tags
    use 'navarasu/onedark.nvim'
    use 'kdheepak/tabline.nvim'
    use 'windwp/nvim-ts-autotag'
    -- Markdown Preview
    use({ 
        "iamcco/markdown-preview.nvim", 
        run = "cd app && npm install", 
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, 
        ft = { "markdown" }, 
    })


end)
