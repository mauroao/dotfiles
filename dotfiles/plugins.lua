-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- https://github.com/Mofiqul/vscode.nvim
    use 'Mofiqul/vscode.nvim'
    
    -- https://github.com/nanotee/nvim-lua-guide
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
   }
   
    -- https://github.com/windwp/nvim-autopairs
    use 'windwp/nvim-autopairs'

    -- https://github.com/nvim-lualine/lualine.nvim
    use 'nvim-lualine/lualine.nvim'

    -- https://github.com/gpanders/editorconfig.nvim
    use 'gpanders/editorconfig.nvim'

    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }   

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- https://github.com/romgrk/barbar.nvim
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    
end)
