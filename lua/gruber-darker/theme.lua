-- lua/gruber-darker/theme.lua
-- Highlight group definitions for gruber-darker.nvim

local M = {}

---Generate the highlight map for the given palette and user options.
---@param p table the resolved palette
---@param opts table user configuration options
---@return table<string, table> highlight group definitions
function M.groups(p, opts)
  local bg = opts.transparent and "NONE" or p.bg
  local bg_float = opts.transparent and "NONE" or p.bg_float
  local italic_comments = opts.italic_comments and true or false
  local bold_keywords = opts.bold_keywords and true or false

  return {
    -- =========================================================================
    -- Editor UI
    -- =========================================================================
    Normal       = { fg = p.fg, bg = bg },
    NormalNC     = { fg = p.fg, bg = bg },
    NormalFloat  = { fg = p.fg, bg = bg_float },
    FloatBorder  = { fg = p.border, bg = bg_float },
    FloatTitle   = { fg = p.keyword, bg = bg_float, bold = true },

    Cursor       = { fg = p.bg, bg = p.fg_white },
    lCursor      = { fg = p.bg, bg = p.fg_white },
    CursorIM     = { fg = p.bg, bg = p.fg_white },
    TermCursor   = { fg = p.bg, bg = p.fg_white },
    TermCursorNC = { fg = p.bg, bg = p.grey },

    CursorLine   = { bg = p.bg_line },
    CursorColumn = { bg = p.bg_line },
    ColorColumn  = { bg = p.bg_line },

    LineNr       = { fg = p.grey, bg = bg },
    CursorLineNr = { fg = p.keyword, bg = p.bg_line, bold = true },

    Visual       = { bg = p.bg_sel },
    VisualNOS    = { bg = p.bg_sel },

    Search       = { fg = p.bg, bg = p.keyword },
    IncSearch    = { fg = p.bg, bg = p.string },
    CurSearch    = { fg = p.bg, bg = p.string },

    StatusLine   = { fg = p.fg, bg = p.bg_line },
    StatusLineNC = { fg = p.grey, bg = p.bg_dark },
    WinBar       = { fg = p.fg, bg = bg },
    WinBarNC     = { fg = p.grey, bg = bg },
    WinSeparator = { fg = p.border, bg = "NONE" },
    VertSplit    = { fg = p.border, bg = "NONE" },

    Pmenu        = { fg = p.fg, bg = p.bg_float },
    PmenuSel     = { fg = p.fg_white, bg = p.bg_sel, bold = true },
    PmenuSbar    = { bg = p.bg_dark },
    PmenuThumb   = { bg = p.scrollthumb },

    TabLine      = { fg = p.grey, bg = p.bg_dark },
    TabLineSel   = { fg = p.fg_white, bg = bg, bold = true },
    TabLineFill  = { bg = p.bg_dark },

    Folded       = { fg = p.grey, bg = p.bg_line },
    FoldColumn   = { fg = p.grey, bg = bg },
    SignColumn   = { fg = p.grey, bg = bg },

    -- Tsoding Emacs show-paren-match: clean subtle background box, NO PURPLE!
    MatchParen   = { bg = p.bg_paren, bold = true },

    Directory    = { fg = p.func, bold = true },
    Title        = { fg = p.keyword, bold = true },
    ErrorMsg     = { fg = p.error, bold = true },
    WarningMsg   = { fg = p.warn, bold = true },
    ModeMsg      = { fg = p.fg, bold = true },
    MoreMsg      = { fg = p.func, bold = true },
    Question     = { fg = p.keyword },
    NonText      = { fg = p.grey_dim },
    Whitespace   = { fg = p.grey_dim },
    SpecialKey   = { fg = p.grey_dim },

    -- =========================================================================
    -- Standard Syntax
    -- =========================================================================
    Comment        = { fg = p.comment, italic = italic_comments },
    Constant       = { fg = p.constant },
    String         = { fg = p.string },
    Character      = { fg = p.string },
    Number         = { fg = p.number },
    Boolean        = { fg = p.constant, bold = true },
    Float          = { fg = p.number },

    Identifier     = { fg = p.var },
    Function       = { fg = p.func },

    Statement      = { fg = p.keyword, bold = bold_keywords },
    Conditional    = { fg = p.keyword, bold = bold_keywords },
    Repeat         = { fg = p.keyword, bold = bold_keywords },
    Label          = { fg = p.keyword },
    Operator       = { fg = p.operator },
    Keyword        = { fg = p.keyword, bold = bold_keywords },
    Exception      = { fg = p.error, bold = true },

    PreProc        = { fg = p.type },
    Include        = { fg = p.keyword },
    Define         = { fg = p.keyword },
    Macro          = { fg = p.func },
    PreCondit      = { fg = p.keyword },

    Type           = { fg = p.type },
    StorageClass   = { fg = p.keyword },
    Structure      = { fg = p.type },
    Typedef        = { fg = p.type },

    Special        = { fg = p.quartz },
    SpecialChar    = { fg = p.number },
    Tag            = { fg = p.keyword },
    -- Punctuation & Delimiters: Tsoding's clean foreground (NEVER purple!)
    Delimiter      = { fg = p.delimiter },
    SpecialComment = { fg = p.comment, bold = true },
    Debug          = { fg = p.error },

    Underlined     = { underline = true },
    Bold           = { bold = true },
    Italic         = { italic = true },
    Ignore         = { fg = p.grey_dim },
    Error          = { fg = p.error, bold = true },
    Todo           = { fg = p.bg, bg = p.keyword, bold = true },

    -- =========================================================================
    -- Tree-sitter (@...)
    -- =========================================================================
    ["@comment"]               = { link = "Comment" },
    ["@comment.documentation"] = { fg = p.comment, italic = italic_comments },

    ["@keyword"]               = { link = "Keyword" },
    ["@keyword.function"]      = { fg = p.keyword, bold = bold_keywords },
    ["@keyword.return"]        = { fg = p.keyword, bold = bold_keywords },
    ["@keyword.operator"]      = { fg = p.keyword, bold = bold_keywords },
    ["@keyword.import"]        = { fg = p.keyword },
    ["@keyword.conditional"]   = { link = "Conditional" },
    ["@keyword.repeat"]        = { link = "Repeat" },

    ["@function"]              = { link = "Function" },
    ["@function.builtin"]      = { fg = p.func },
    ["@function.call"]         = { fg = p.func },
    ["@function.macro"]        = { fg = p.func },
    ["@function.method"]       = { fg = p.func },
    ["@function.method.call"]  = { fg = p.func },

    ["@method"]                = { fg = p.func },
    ["@method.call"]           = { fg = p.func },

    ["@string"]                = { link = "String" },
    ["@string.regex"]          = { fg = p.number },
    ["@string.escape"]         = { fg = p.number, bold = true },
    ["@string.special"]        = { fg = p.number },

    ["@character"]             = { link = "Character" },
    ["@character.special"]     = { link = "SpecialChar" },

    ["@number"]                = { link = "Number" },
    ["@number.float"]          = { link = "Float" },
    ["@boolean"]               = { link = "Boolean" },

    ["@type"]                  = { link = "Type" },
    ["@type.builtin"]          = { fg = p.type },
    ["@type.definition"]       = { fg = p.type },
    ["@type.qualifier"]        = { fg = p.keyword },

    ["@constant"]              = { link = "Constant" },
    ["@constant.builtin"]      = { fg = p.constant },
    ["@constant.macro"]        = { fg = p.constant },

    ["@variable"]              = { fg = p.var },
    ["@variable.builtin"]      = { fg = p.constant },
    ["@variable.parameter"]    = { fg = p.fg },
    ["@variable.member"]       = { fg = p.fg },

    ["@property"]              = { fg = p.fg },
    ["@operator"]              = { fg = p.operator },

    -- BRACKETS & PUNCTUATION: The critical Tsoding fix — clean foreground!
    ["@punctuation.bracket"]   = { fg = p.delimiter },
    ["@punctuation.delimiter"] = { fg = p.delimiter },
    ["@punctuation.special"]   = { fg = p.delimiter },

    ["@constructor"]           = { fg = p.type },
    ["@label"]                 = { fg = p.keyword },
    ["@tag"]                   = { fg = p.keyword },
    ["@tag.attribute"]         = { fg = p.type },
    ["@tag.delimiter"]         = { fg = p.delimiter },

    -- =========================================================================
    -- LSP & Diagnostics
    -- =========================================================================
    DiagnosticError            = { fg = p.error },
    DiagnosticWarn             = { fg = p.warn },
    DiagnosticInfo             = { fg = p.info },
    DiagnosticHint             = { fg = p.hint },

    DiagnosticUnderlineError   = { sp = p.error, undercurl = true },
    DiagnosticUnderlineWarn    = { sp = p.warn, undercurl = true },
    DiagnosticUnderlineInfo    = { sp = p.info, undercurl = true },
    DiagnosticUnderlineHint    = { sp = p.hint, undercurl = true },

    LspReferenceText           = { bg = p.bg_line },
    LspReferenceRead           = { bg = p.bg_line },
    LspReferenceWrite          = { bg = p.bg_line, underline = true },
    LspSignatureActiveParameter= { fg = p.keyword, bold = true },

    -- =========================================================================
    -- Git / Diff
    -- =========================================================================
    DiffAdd                    = { fg = p.git_add, bg = p.bg_dark },
    DiffChange                 = { fg = p.git_change, bg = p.bg_dark },
    DiffDelete                 = { fg = p.git_delete, bg = p.bg_dark },
    DiffText                   = { fg = p.fg_white, bg = p.bg_sel },

    GitSignsAdd                = { fg = p.git_add },
    GitSignsChange             = { fg = p.git_change },
    GitSignsDelete             = { fg = p.git_delete },

    -- =========================================================================
    -- Plugins
    -- =========================================================================
    -- Telescope
    TelescopeNormal            = { fg = p.fg, bg = bg_float },
    TelescopeBorder            = { fg = p.border, bg = bg_float },
    TelescopeTitle             = { fg = p.keyword, bg = bg_float, bold = true },
    TelescopePromptNormal      = { fg = p.fg, bg = p.bg_line },
    TelescopePromptBorder      = { fg = p.border, bg = p.bg_line },
    TelescopePromptPrefix      = { fg = p.keyword, bold = true },
    TelescopeSelection         = { fg = p.fg_white, bg = p.bg_sel, bold = true },
    TelescopeMatching          = { fg = p.string, bold = true },

    -- NvimTree
    NvimTreeNormal             = { fg = p.fg, bg = bg },
    NvimTreeNormalNC           = { fg = p.fg, bg = bg },
    NvimTreeRootFolder         = { fg = p.keyword, bold = true },
    NvimTreeFolderName         = { fg = p.func, bold = true },
    NvimTreeFolderIcon         = { fg = p.keyword },
    NvimTreeEmptyFolderName    = { fg = p.grey },
    NvimTreeOpenedFolderName  = { fg = p.func, bold = true },
    NvimTreeSpecialFile        = { fg = p.keyword, underline = true },
    NvimTreeGitDirty           = { fg = p.git_change },
    NvimTreeGitNew             = { fg = p.git_add },
    NvimTreeGitDeleted         = { fg = p.git_delete },

    -- BufferLine
    BufferLineFill             = { bg = p.bg_dark },
    BufferLineBackground       = { fg = p.grey, bg = p.bg_dark },
    BufferLineBufferSelected   = { fg = p.fg_white, bg = bg, bold = true },
    BufferLineSeparator        = { fg = p.bg_dark, bg = p.bg_dark },
    BufferLineSeparatorSelected= { fg = p.bg_dark, bg = bg },
    BufferLineIndicatorSelected= { fg = p.keyword, bg = bg },

    -- Cmp
    CmpItemAbbrDeprecated      = { fg = p.grey, strikethrough = true },
    CmpItemAbbrMatch           = { fg = p.string, bold = true },
    CmpItemAbbrMatchFuzzy      = { fg = p.string, bold = true },
    CmpItemKind                = { fg = p.func },
    CmpItemKindFunction        = { fg = p.func },
    CmpItemKindMethod          = { fg = p.func },
    CmpItemKindVariable        = { fg = p.var },
    CmpItemKindKeyword         = { fg = p.keyword },
    CmpItemKindClass           = { fg = p.type },
    CmpItemKindInterface       = { fg = p.type },
    CmpItemKindText            = { fg = p.fg },

    -- Gitsigns
    gitsignsSelect             = { bg = p.bg_sel },

    -- WhichKey
    WhichKey                   = { fg = p.keyword },
    WhichKeyGroup              = { fg = p.func },
    WhichKeyDesc               = { fg = p.fg },
    WhichKeySeparator          = { fg = p.grey },
    WhichKeyFloat              = { bg = bg_float },
  }
end

return M
