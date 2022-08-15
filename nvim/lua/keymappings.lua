-- Telescope remmaps hotkeys
vim.keymap.set("n", "<leader>ff", function() require('telescope.builtin').find_files() end) 
vim.keymap.set("n", "<leader>fg", function() require('telescope.builtin').live_grep() end) 
vim.keymap.set("n", "<leader>fb", function() require('telescope.builtin').buffers() end) 
vim.keymap.set("n", "<leader>fh", function() require('telescope.builtin').help_tags() end) 

-- Window key mappings move window location
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", {noremap = true}) -- Move down one window
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", {noremap = true}) -- Move down one window
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", {noremap = true}) -- Move down one window
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", {noremap = true}) -- Move down one window

-- Key mapping for undo tree
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>", {noremap = true})         -- Open the undo tree

-- Window key mapping for opening the current directory
vim.keymap.set("n", "<leader>pv", ":wincmd v<bar> :Ex<bar> :vertical resize 30<CR>", {noremap = true})

-- Window key mapping for resizing a window
vim.keymap.set("n", "<leader>+", ":vertical resize +5<CR>", {silent = true})    -- Increase current window size
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>", {silent = true})    -- Decrease current window size

-- Buffer Navigation mapping
vim.keymap.set("n", "<leader>bn", ":bn<CR>", {noremap = true})      -- Move to next buffer/page
vim.keymap.set("n", "<leader>bp", ":bp<CR>", {noremap = true})      -- Move to prev buffer/page
vim.keymap.set("n", "<leader>bf", ":bf<CR>", {noremap = true})      -- Move to first buffer/page
vim.keymap.set("n", "<leader>bl", ":bl<CR>", {noremap = true})      -- Move to last buffer/page
vim.keymap.set("n", "<leader><Tab>", ":e #<CR>", {noremap = true})  -- Move to prev buffer/page viewed

