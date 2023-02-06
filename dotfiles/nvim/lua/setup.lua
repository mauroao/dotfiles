-- Color Scheme:

local function github_theme()
  require('github-theme').setup {
    theme_style = "dark_default", -- dark, dimmed, dark_default, dark_colorblind, light,light_default, light_colorblind
     keyword_style = "NONE",
  }
  -- require('github-theme').load()
  vim.api.nvim_command("hi NonText ctermfg=7 guifg=gray") -- show charactere at end of line when :set list
  vim.api.nvim_command("hi NormalFloat guibg=#161b22") -- make Floating windows background color better to see
  vim.api.nvim_command("set guioptions+=b")
end

local function dracula_theme()
  require('dracula').setup {}
  require('dracula').load()
end

local function vscode_theme()
  vim.o.background = 'dark' -- light, dark

  local c = require('vscode.colors').get_colors()
  require('vscode').setup({
    transparent = false,
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
    style = 'darker', -- darker, dark, cool, deep, warm, warmer
    transparent = false,
  }
  require('onedark').load()
end

-- vscode_theme()
-- onedark_theme()
-- dracula_theme()
github_theme()

-- Nvim Tree:
require'nvim-tree'.setup {
  git = {
    enable = true,
    ignore = false,
    -- show_on_dirs = true,
    -- show_on_open_dirs = true,
    timeout = 400,
  },
}

-- Autopairs
require('nvim-autopairs').setup()

-- Lualine
require'lualine'.setup {
  sections = {
    lualine_x = {
      {
        'fileformat',
        icons_enabled = true,
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
    },
    lualine_y = {'encoding', 'filetype'},
    lualine_z = {'location', 'progress'},
  },
}

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
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = '|',
  icon_separator_inactive = '|',
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
  bufferline_state.set_offset(30, "File Tree")
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

-- WSL 2 hack for copy and paste

vim.opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Yank', { clear = true }),
    callback = function()
      vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,
  })
end


