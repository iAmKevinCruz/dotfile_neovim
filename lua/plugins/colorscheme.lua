return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      integrations = {
        dropbar = {
          enabled = true,
          color_mode = true, -- enable color for kind's texts, not just kind's icons
        },
        flash = true,
        harpoon = true,
        indent_blankline = {
          enabled = true,
          -- scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = true,
        },
        mason = true,
        mini = {
          enabled = true,
          -- indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: textlist
        },
        neogit = true,
        cmp = true,
        nvimtree = {
          enabled = true,
          show_root = true, -- makes the root folder not transparent
        },
        ufo = true,
        symbols_outline = true,
        rainbow_delimiters = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        }
      }
    },
    config = function (_,opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
}
