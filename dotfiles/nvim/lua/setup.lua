-- Color Scheme:

local function vscode_theme()
  vim.o.background = 'dark' -- light

  local c = require('vscode.colors').get_colors()
  require('vscode').setup({
    transparent = true,
    italic_comments = true,
    disable_nvimtree_bg = true,
    color_overrides = {
      vscLineNumber = '#FFFFFF',
    },
    group_overrides = {
      Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
  })
end

local function onedark_theme()
  require('onedark').setup {
    style = 'warm', -- darker, dark, cool, deep, warm, warmer
    transparent = true,
  }
  require('onedark').load()
end

-- vscode_theme()
onedark_theme()

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

-- LSP progress
require"fidget".setup{}


