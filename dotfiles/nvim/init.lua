-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('plugins')
require('options')
require('keymappings')
require('setup')
require('nvim-cmp')
require('nvim-lspconfig')

