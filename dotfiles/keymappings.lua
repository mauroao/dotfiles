-- Change leader to space:
vim.g.mapleader = ' '

-- Key mappings:
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true } )
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true } )
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true } )
