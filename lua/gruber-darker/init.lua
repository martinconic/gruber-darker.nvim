-- lua/gruber-darker/init.lua
-- Canonical Neovim port of Tsoding's Gruber Darker Emacs theme.

local M = {}

M.defaults = {
  transparent     = false, -- transparent background
  italic_comments = true,  -- italicise comments
  bold_keywords   = true,  -- bold keywords
  on_highlights   = nil,   -- function(groups, palette) -> mutate groups before apply
}

M.options = vim.deepcopy(M.defaults)

---Merge user options into defaults.
---@param opts table|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})

  -- Register :GruberDarker user command
  vim.api.nvim_create_user_command("GruberDarker", function()
    M.load()
  end, {
    desc = "Load the canonical Gruber Darker theme",
  })
end

---Apply the colorscheme.
function M.load()
  local opts = M.options
  local palette = require("gruber-darker.palette").darker

  if vim.g.colors_name then vim.cmd.highlight("clear") end
  if vim.fn.exists("syntax_on") == 1 then vim.cmd.syntax("reset") end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "gruber-darker"

  local groups = require("gruber-darker.theme").groups(palette, opts)

  if type(opts.on_highlights) == "function" then
    opts.on_highlights(groups, palette)
  end

  for group, val in pairs(groups) do
    vim.api.nvim_set_hl(0, group, val)
  end
end

---Expose the raw palette for external use (statuslines, custom scripts).
M.palette = require("gruber-darker.palette").darker

return M
