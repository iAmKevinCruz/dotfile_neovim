-- Keymaps
-- Lazygit
vim.keymap.set('n', '<leader>gg', ':LazyGit <CR>', { desc = 'Open floating LazyGit', silent = true })
vim.keymap.set('n', '<leader>gf', ':LazyGitFilter <CR>', { desc = 'Open floating LazyGitFilter to see all commits', silent = true })
vim.keymap.set('n', '<leader>gfc', ':LazyGitFilterCurrentFile <CR>', { desc = 'Open floating LazyGitFilterCurrentFile to see all commits', silent = true })


-- Git Worktree
-- vim.keymap.set('n', '<leader>gw', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', { desc = 'Open [G]it-[W]orktrees via Telescope', silent = true })
-- vim.keymap.set('n', '<leader>gW', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', { desc = 'Create new Git Worktree via Telescope', silent = true })

-- Git fugitive
vim.keymap.set('n', '<leader>gc', '<CMD>Git commit<CR>', { desc = '[G]it [C]ommit via Fugitive', silent = true })
vim.keymap.set('n', '<leader>gp', '<CMD>Git push<CR>', { desc = '[G]it [P]ush via Fugitive', silent = true })

return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  --[[ {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "gitsigns.nvim" } }
            end)
          end
        end,
      })
    end,
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      current_line_blame = true,
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
        vim.keymap.set('n', '<leader>td', require("gitsigns").toggle_deleted, { desc = 'Toggle deleted', silent = true })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  }, ]]

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    lazy = false,
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = false,
        file_panel = {
          listing_style = "list"
        }
      })
    end
  },

  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    config = function()
      require('neogit').setup()
      vim.keymap.set('n', '<leader>nn', '<CMD>Neogit<CR>', { desc = 'Open [N]eogit' })
    end
  },

  {
    'kdheepak/lazygit.nvim',
    lazy = false,
  },

  --[[ {
    -- https://github.com/ThePrimeagen/git-worktree.nvim/pull/106
    "brandoncc/git-worktree.nvim",
    event = "VeryLazy",
    branch = "catch-and-handle-telescope-related-error",
    keys = {
      {
        "<leader>pw",
        function()
          local Job = require("plenary.job")

          local current_file = vim.fn.resolve(vim.fn.expand("%"))
          local project_root_directory = utils.get_git_root_directory(current_file)
          local file_directory = vim.fn.fnamemodify(current_file, ":p:h")
          local branch_name = utils.branch_name(nil, file_directory)

          Job:new({
            command = "zellij",
            args = {
              "run",
              "-f",
              "--",
              "zsh",
            },
            cwd = project_root_directory,
            on_exit = function()
              Job:new({
                command = "zellij",
                args = {
                  "action",
                  "rename-pane",
                  branch_name,
                },
              }):start()
            end,
          }):start()
        end,
      },
    },
    config = true
  }, ]]
}
