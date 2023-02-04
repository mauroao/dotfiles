-- Change leader to space:
vim.g.mapleader = ' '

-- Key mappings:
vim.api.nvim_set_keymap('n', '<leader>e',  ':NvimTreeToggle<CR>',       { noremap = true, desc = 'Toggle File Explorer' } )
vim.api.nvim_set_keymap('n', '<leader>h',  '<C-w>h',                    { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>l',  '<C-w>l',                    { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>j',  '<C-w>j',                    { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>k',  '<C-w>k',                    { noremap = true } )
vim.api.nvim_set_keymap('i', 'jj',         '<ESC>',                     { noremap = true } )
vim.api.nvim_set_keymap('i', 'jk',         '<ESC>',                     { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = 'Telescope - Find Files' } )
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>',    { noremap = true, desc = 'Telescope - Find in Buffers' } )
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>',  { noremap = true, desc = 'Telescope - Find text in Files' } )
vim.api.nvim_set_keymap('n', '<leader>,',  ':BufferPrevious<CR>',       { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>.',  ':BufferNext<CR>',           { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>z',  ':BufferClose<CR>',          { noremap = true } )


