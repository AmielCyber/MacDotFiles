-- Neovim Global Settings
vim.opt.number = true           -- Show line numbers
vim.opt.mouse = "nv"            -- Mouse support. Yikes!!! Sorry I know is a sin...
vim.opt.tabstop = 4             -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4         -- Number of spaces when pressing tab while performin edits
vim.opt.shiftwidth = 4          -- Newline indentation
vim.opt.expandtab = true        -- Indents while going on insert
vim.opt.smartindent = true      -- Smart indent when starting a new line
vim.opt.incsearch = true        -- Highlight as you search
vim.opt.hlsearch = false        -- stop highlighting after searching
vim.opt.colorcolumn= "120"      -- Column marker at 120 characters
vim.opt.signcolumn = "yes"      -- Always have the column displayed
vim.opt.scrolloff = 10          -- Keeps 10 lines of buffer from the top or bottom when scrolling
vim.opt.wrap = false            -- No character wrapping when page width has exceeded
vim.opt.termguicolors = true    -- Get the sweet color support from the terminal
vim.opt.cmdheight = 1           -- Give more space for displaying messages
vim.g.mapleader = " "           -- Map leader for custom key remaps
vim.opt.hidden = true           -- Fast file swapping
vim.opt.laststatus = 2

-- To be used with undofile Plugin
vim.opt.swapfile = false        -- Dont use vim's swapfile system
vim.opt.backup = false          -- Dont use vim's backup file
vim.opt.undofile = true         -- Set undo file and be stored in the undo directory with our undodir plugin
-- Undo directory where all the undo files will be stored at
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Window Settings
vim.g.netrw_browse_split = 2
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Color Scheme
--vim.g.tokyonight_style = "storm"
--vim.g.tokyonight_italic_functions = true
--vim.g.tokyonight_transparent = false
--vim.g.tokyonight_transparent_sidebar = true
--vim.cmd('colorscheme tokyonight')
--vim.opt.background = 'dark'
--vim.g.everforest_background = 'hard'
--vim.cmd('colorscheme everforest')
require("one_monokai").setup({ transparent = false})
