-- Keymaps
vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeFocus<CR>', { desc = 'NvimTree Focus', silent = true })
vim.keymap.set('n', '<leader>E', '<CMD>NvimTreeToggle<CR>', { desc = 'NvimTree Toggle', silent = true })

return {
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = false,
        update_root = false,
      },
      view = {
        adaptive_size = false,
        side = "right",
        width = 30,
        preserve_window_proportions = true,
      },
      git = {
        enable = false,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",

        indent_markers = {
          enable = false,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },

          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      local colors_name = vim.g.colors_name
      local flavor = string.match(colors_name, "catppuccin%-(%w+)")
      local palette = require("catppuccin.palettes").get_palette(flavor)

      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = palette.base })
      vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = palette.base })
    end
  },
}
