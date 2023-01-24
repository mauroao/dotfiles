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
    --exclude_ft = {'javascript'},
    --exclude_name = {'package.json'},
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

-- Wich key
require('which-key').setup {}

-- Table offset (integrating nvim-tree with barbar)
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.api')

nvim_tree_events.on_tree_open(function ()
    bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
    bufferline_state.set_offset(0)
end)

-- Illuminate
require('illuminate').configure()

-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    'pyright',
    'tsserver',
    'omnisharp',
    'html',
    'sumneko_lua'
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "python",
      "javascript",
      "typescript",
      "c_sharp",
      "lua",
      "html",
      "css",
      "json",
      "bash",
      "markdown",
      "yaml"
    },
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true
  },
}
