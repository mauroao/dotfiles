-- Color Scheme:

local function github_theme()
  require('github-theme').setup {
    theme_style = "dark_default", -- dark, dimmed, dark_default, dark_colorblind, light,light_default, light_colorblind
    keyword_style = "NONE",
    overrides = function (c)
      return {
        NormalFloat = { fg = c.fg, bg = "#313945" },
        Pmenu = { fg = c.fg, bg = "#313945" },
        NonText = { fg = "#d3d3d3"  }
        -- https://raw.githubusercontent.com/projekt0n/github-nvim-theme/c55aab623fae25e513ec7737c9423c23b11422c0/lua/github-theme/theme.lua
      }
    end
  }
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
  icons = {
    filetype = {
      enabled
    },
    inactive = {
      separator = {
        left = '|'
      }
    },
    modified = {
      button = '●',
    },
    button = 'x',
    pinned = {
      button = '車'
    },
    separator = {
      left = '|'
    },
  },
  sidebar_filetypes = {
    NvimTree = true
  },
  icon_custom_colors = false,
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
    enable = true,
    disable = {
      "lua"
    }
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


