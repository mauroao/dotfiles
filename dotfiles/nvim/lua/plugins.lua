-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'            -- packer manage it self

    use 'kyazdani42/nvim-web-devicons'      -- used by other plugins
    use 'nvim-lua/plenary.nvim'             -- used by other plugins

    use 'Mofiqul/vscode.nvim'               -- VSCode like theme
    use 'kyazdani42/nvim-tree.lua'          -- File tree
    use 'windwp/nvim-autopairs'             -- Open/close brackets
    use 'nvim-lualine/lualine.nvim'         -- Vim Status bar
    use 'gpanders/editorconfig.nvim'        -- Editorconfig
    use 'nvim-telescope/telescope.nvim'     -- Telescope
    use 'romgrk/barbar.nvim'                -- Tabs

    use 'neovim/nvim-lspconfig'             -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp'                  -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'              -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lua'              -- LUA source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'          -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'                  -- Snippets plugin
end)
