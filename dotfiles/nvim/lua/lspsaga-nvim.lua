local saga = require('lspsaga')

saga.init_lsp_saga()

local opt = { noremap = true }
local finder = require('lspsaga.finder')
local action = require("lspsaga.codeaction")
local hover = require("lspsaga.hover")

vim.keymap.set("n", "gh", finder.lsp_finder, opt)
vim.keymap.set("n", "<leader>ca", action.code_action, opt)
vim.keymap.set("n", "K", hover.render_hover_doc, opt)
