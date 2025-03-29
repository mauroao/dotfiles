vim.api.nvim_set_keymap('i', 'jj',         '<ESC>',                     { noremap = true } )
vim.api.nvim_set_keymap('i', 'jk',         '<ESC>',                     { noremap = true } )

-- for dotnet
lvim.plugins = {
  { "editorconfig/editorconfig-vim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require"lsp_signature".on_attach({ hint_enable = false }) end,
  },
}

vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab

