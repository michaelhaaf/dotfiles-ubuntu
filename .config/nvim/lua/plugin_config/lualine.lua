local gps = require("nvim-gps")

-- Display an indicator of tag generation progress
local function gutenTagsProgress()
  return vim.fn['gutentags#statusline']('[', ']')
end

-- For mode, only show the first char (or first two chars to distinguish
-- different VISUALs)
local function simplifiedMode(str)
  return str == "V-LINE" and "VL" or (str == "V-BLOCK" and "VB" or str:sub(1, 1))
end

-- For location, show total lines
local function customLocation(str)
  return string.gsub(str, "%w+", "%1" .. "/%%L", 1)
end

-- This is hacky. I should probably make my own theme and contribute it.
local custom_theme = require'lualine.themes.auto'

custom_theme.normal.c.bg = "#393552"
custom_theme.command.c.bg = "#393552"
-- custom_theme.visual.c.bg = "#393552"
-- custom_theme.replace.c.bg = "#393552"
-- custom_theme.insert.c.bg = "#393552"

vim.opt.termguicolors = true
require 'lualine'.setup {


  options = {
    icons_enabled = true,
    theme = custom_theme,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true, -- requires neovim 0.7 or highter
  },
  sections = {
    -- Left
    lualine_a = {
      {
        'mode',
        fmt = simplifiedMode,
      },
    },
    lualine_b = {
      'branch',
      {
        'diff',
        symbols = { added = '+', modified = '~', removed = '-' },
      },
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      }
    },
    lualine_c = {
      {
        'filename',
        symbols = {
          modified = '[+]',
          readonly = '[]',
          unnamed = '[No Name]',
        },
      },
    },

    -- Right
    lualine_x = {
      {
        gps.get_location,
        cond = gps.is_available,
        color = { fg = '#d3869b' },
      },
      gutenTagsProgress,
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {
      {
        'location',
        fmt = customLocation,
      },
    },
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'quickfix', 'fugitive', 'nvim-tree', 'aerial', 'toggleterm' }
}
