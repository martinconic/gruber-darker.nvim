# gruber-darker.nvim

A faithful, distraction-free Neovim port of **Alexey Kutepov's (Tsoding / `rexim`)** canonical [Gruber Darker theme for Emacs](https://github.com/rexim/gruber-darker-theme).

---

## Why this port?

Existing Neovim ports of Gruber Darker (such as `blazkowolf/gruber-darker.nvim`) took creative liberties by coloring all brackets and parentheses with `wisteria` (`#9e95c7`, a muted purple).

In Tsoding's real Emacs setup:
* **Parentheses and brackets `() {} []` are NOT purple.** They use the clean default text foreground (`#e4e4ef`), keeping code readable and distraction-free.
* **Delimiters (commas, semicolons, colons)** are neutral foreground.
* **Matching parentheses** follow Emacs's `show-paren-mode` with a subtle charcoal box (`#52494e`), never a distracting color.

This plugin provides a **100% faithful port** of Tsoding's real Emacs look for Neovim.

---

## Palette

| Color Name | Hex Code | Usage |
| :--- | :--- | :--- |
| `bg` | `#181818` | Editor background |
| `bg_line` | `#282828` | Cursor line |
| `bg_sel` | `#453d41` | Visual selection |
| `bg_paren` | `#52494e` | Matching parenthesis (show-paren) |
| `fg` | `#e4e4ef` | Text foreground, brackets, delimiters |
| `keyword` | `#ffdd33` | Gold/yellow keywords (`bold`) |
| `string` | `#73c936` | Strings |
| `comment` | `#cc8c3c` | Brown comments (`italic`) |
| `type` | `#95a99f` | Quartz types and constants |
| `func` | `#96a6c8` | Niagara function and method names |
| `number` | `#9e95c7` | Wisteria numbers |
| `error` | `#f43841` | Red errors and diagnostics |

---

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "martinconic/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruber-darker").setup({
      -- Options (defaults shown):
      transparent = false,     -- set true for transparent background
      italic_comments = true,  -- italicise comments
      bold_keywords = true,    -- bold keywords
    })
    vim.cmd.colorscheme("gruber-darker")
  end,
}
```

### Local Development (before publishing to GitHub)

If you have cloned this repository locally:

```lua
{
  dir = "/home/calin/repos/martinconic/gruber-darker.nvim",
  name = "gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruber-darker").setup({})
    vim.cmd.colorscheme("gruber-darker")
  end,
}
```

---

## Configuration

You can customize the theme with `setup()`:

```lua
require("gruber-darker").setup({
  transparent = false,
  italic_comments = true,
  bold_keywords = true,
  on_highlights = function(groups, palette)
    -- Override any highlight group on the fly:
    -- groups.Normal = { fg = palette.fg, bg = "#000000" }
  end,
})
```

---

## Credits

* **Alexey Kutepov (Tsoding / `rexim`)** for the canonical [Emacs gruber-darker-theme](https://github.com/rexim/gruber-darker-theme).
* **Jason R. Blevins** for the original Emacs adaptation.
* **John Gruber** for the original Gruber Dark color scheme for BBEdit.
