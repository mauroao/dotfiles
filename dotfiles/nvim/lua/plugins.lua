-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

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
    use 'Issafalcon/lsp-overloads.nvim'     -- LSP Overloads

    use 'hrsh7th/nvim-cmp'                  -- Completion engine plugin
    use 'hrsh7th/cmp-nvim-lsp'              -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lua'              -- LUA source for nvim-cmp
    use 'hrsh7th/cmp-buffer'                -- buffer completions
    use 'L3MON4D3/LuaSnip'                  -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip'          -- Snippets source for nvim-cmp
    use "rafamadriz/friendly-snippets"      -- a bunch of snippets to use
    use 'folke/which-key.nvim'              -- Popup with key bindings of the command you started typing
    use 'RRethy/vim-illuminate'             -- Highlighting other uses of the word under the cursor
    use 'j-hui/fidget.nvim'                 -- LSP progress

     -- Managing & installing lsp servers
    use("williamboman/mason.nvim")           -- In charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- Bridges gap b/w mason & lspconfig

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)
