return {
  -- {
  --   'MeanderingProgrammer/markdown.nvim',
  --   name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   config = function()
  --     require('render-markdown').setup({})
  --   end,
  -- },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      block_quotes = {
        enable = true,

        default = {
          border = "▋",
          border_hl = "MarkviewBlockQuoteDefault"
        },

        callouts = {
          {
            match_string = "bible",
            callout_preview = " Bible",
            callout_preview_hl = "MarkviewBlockQuoteNote",

            custom_title = true,
            custom_icon = " ",

            border = "▋",
            border_hl = "MarkviewBlockQuoteDefault"
          }
        }
      }
    },
    config = function(_, opts)
      require("markview").setup(opts)

      vim.keymap.set('n', '<leader>tm', '<cmd>Markview toggleAll<cr>', { silent = true, desc = "[T]oggle [M]arkview" })
      -- require("markview").setup({
      --   modes = { "n", "no", "c" }, -- Change these modes
      --   -- to what you need
      --
      --   hybrid_modes = { "i" },     -- Uses this feature on
      --   -- normal mode
      --
      --   -- This is nice to have
      --   callbacks = {
      --     on_enable = function (_, win)
      --       vim.wo[win].conceallevel = 2;
      --       vim.wo[win].conecalcursor = "c";
      --     end
      --   }
      -- })
      -- require("markview").setup({
      --   modes = { "n", "i", "no", "c" },
      --   hybrid_modes = { "i" },
      --
      --   -- This is nice to have
      --   callbacks = {
      --     on_enable = function (_, win)
      --       vim.wo[win].conceallevel = 2;
      --       vim.wo[win].conecalcursor = "nc";
      --     end
      --   }
      -- })
    end,
  }
}
