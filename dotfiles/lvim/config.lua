vim.api.nvim_set_keymap('i', 'jj',         '<ESC>',                     { noremap = true } )
vim.api.nvim_set_keymap('i', 'jk',         '<ESC>',                     { noremap = true } )

lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require"lsp_signature".on_attach({ hint_enable = false }) end,
  },
}
