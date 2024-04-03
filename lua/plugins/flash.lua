-- Keymaps

return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          jump_labels = true,
          label = { exclude = "hjkliIaArdcCvpPygS" }
        },
        search = {
          enabled = false
        }
      }
    },
    keys = {
      {
        "sw",
        mode = { "n", "x" },
        function()
          -- jump to word under cursor
          require("flash").jump({pattern = vim.fn.expand("<cword>")})
        end,
      },
      {
        "ss",
        mode = { "n", "x" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
      },
      {
        "ss",
        mode = { "o" },
        function()
          require("flash").jump()
        end,
      },
      {
        "<leader>ss",
        mode = { "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "<leader>t",
        mode = { "o", "x", "n" },
        function()
          local win = vim.api.nvim_get_current_win()
          local view = vim.fn.winsaveview()
          require("flash").jump({
            action = function(match, state)
              state:hide()
              vim.api.nvim_set_current_win(match.win)
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              require("flash").treesitter()
              vim.schedule(function()
                vim.api.nvim_set_current_win(win)
                vim.fn.winrestview(view)
              end)
            end,
          })
        end,
      },
    },
  },
}
