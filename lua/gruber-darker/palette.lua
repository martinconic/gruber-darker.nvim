-- lua/gruber-darker/palette.lua
-- Canonical Gruber Darker palette based on Alexey Kutepov's (Tsoding / rexim)
-- gruber-darker-theme.el for Emacs: github.com/rexim/gruber-darker-theme

local M = {}

M.darker = {
  -- Surfaces & backgrounds
  bg          = "#181818", -- main editor background
  bg_dark     = "#101010", -- darker background (border, float shadow, terminal)
  bg_line     = "#282828", -- active line / subtle bar
  bg_sel      = "#453d41", -- selection (bg+2)
  bg_linenr   = "#484848", -- line number column / folds
  bg_paren    = "#52494e", -- show-paren matching bracket background (bg+4)
  bg_float    = "#1c1c1c", -- floating windows
  border      = "#484848", -- window borders
  scrollthumb = "#52494e", -- scrollbar thumb

  -- Foregrounds & greys
  fg          = "#e4e4ef", -- editor foreground (clean off-white)
  fg_light    = "#f4f4ff", -- slightly brighter text (variables)
  fg_white    = "#ffffff", -- pure white (cursor, important titles)
  grey        = "#565f73", -- niagara-1 (inactive / line numbers / comments dim)
  grey_dim    = "#303540", -- niagara-2 (darker subtle elements)

  -- Syntax colours (strictly faithful to Tsoding's Emacs palette)
  keyword     = "#ffdd33", -- gold/yellow (keywords, bold)
  string      = "#73c936", -- green (strings)
  comment     = "#cc8c3c", -- brown (comments)
  type        = "#95a99f", -- quartz (types, primitives)
  constant    = "#95a99f", -- quartz (constants, enums, booleans)
  func        = "#96a6c8", -- niagara (functions, methods)
  number      = "#95a99f", -- quartz (numbers match constants, zero purple!)
  operator    = "#e4e4ef", -- foreground (operators: clean and distraction-free)
  delimiter   = "#e4e4ef", -- foreground (brackets, parens, delimiters: ZERO purple!)
  var         = "#f4f4ff", -- fg+1 (variable names)

  -- Diagnostics & Git
  error       = "#f43841", -- red
  warn        = "#ffdd33", -- yellow
  info        = "#96a6c8", -- niagara
  hint        = "#95a99f", -- quartz
  git_add     = "#73c936", -- green
  git_change  = "#ffdd33", -- yellow
  git_delete  = "#c73c3f", -- red-1
}

return M
