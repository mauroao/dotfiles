-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'            -- packer manage it self

    use 'kyazdani42/nvim-web-devicons'      -- used by other plugins
    use 'nvim-lua/plenary.nvim'             -- used by other plugins

    use 'Mofiqul/vscode.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'windwp/nvim-autopairs'
    use 'nvim-lualine/lualine.nvim'
    use 'gpanders/editorconfig.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'romgrk/barbar.nvim'
end)
