-- Color Scheme:
vim.cmd([[colorscheme vscode]])

-- Nvim Tree:
require'nvim-tree'.setup {
    open_on_setup = true
}

-- Autopairs
require('nvim-autopairs').setup()

-- Lualine
require('lualine').setup()

-- Telescope
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            }
        }
    }
}

-- Set barbar's options
require('bufferline').setup {
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    exclude_ft = {'javascript'},
    exclude_name = {'package.json'},
    icons = true,
    icon_custom_colors = false,
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,
}

-- Table offset (integrating nvim-tree with barbar)
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
    bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
    bufferline_state.set_offset(0)
end)

-- Treesitter:
require('nvim-treesitter.configs').setup {
    ensure_installed = { "bash", "lua", "c_sharp", "javascript", "json", "markdown", "python", "typescript" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
