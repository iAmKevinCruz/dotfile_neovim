-- Keymaps
-- mini.files
vim.keymap.set('n', '-', ':lua require("mini.files").open(vim.api.nvim_buf_get_name(0), true)<CR>', { desc = 'Open mini.files floating file manager at current directory', silent = true })
vim.keymap.set('n', '<leader>fe', ':lua require("mini.files").open(vim.loop.cwd(), true)<CR>', { desc = 'Open mini.files floating file manager at root directory', silent = true })

-- mini.session
vim.keymap.set('n', '<leader>msr', ':lua MiniSessions.read()<CR>', { desc = '[M]ini[S]ession [R]ead session', silent = true })

-- mini.diff
vim.keymap.set('n', '<leader>md', ':lua MiniDiff.toggle_overlay()<CR>', { desc = '[M]ini[D]iff toggle overlay', silent = true })

-- mini.pick
vim.keymap.set('n', '<leader>mff', '<CMD>Pick files<CR>', { desc = '[M]iniPick [F]ind [F]iles', silent = true })
vim.keymap.set('n', '<leader>mfb', '<CMD>Pick buffers<CR>', { desc = '[M]iniPick [F]ind [B]uffers', silent = true })
vim.keymap.set('n', '<leader>mfw', '<CMD>Pick grep_live<CR>', { desc = '[M]iniPick [F]ind [W]ord (grep_live)', silent = true })
vim.keymap.set('n', '<leader>mfr', '<CMD>Pick resume<CR>', { desc = '[M]iniPick [F]ind [R]esume', silent = true })
vim.keymap.set('n', '<leader>mhs', '<CMD>Pick history scope="/"<CR>', { desc = '[M]iniPick [H]istory [S]earch', silent = true })
vim.keymap.set('n', '<leader>mhc', '<CMD>Pick history scope=":"<CR>', { desc = '[M]iniPick [H]istory [C]ommand', silent = true })
vim.keymap.set('n', '<leader>mjl', '<CMD>Pick list scope="jump"<CR>', { desc = '[M]iniPick [J]ump [L]ist', silent = true })
vim.keymap.set('n', '<leader>mqf', '<CMD>Pick list scope="quickfix"<CR>', { desc = '[M]iniPick [Q]uick [F]ix', silent = true })
vim.keymap.set('n', '<leader>mm', '<CMD>Pick marks<CR>', { desc = '[M]iniPick [M]arks', silent = true })
vim.keymap.set('n', '<leader>mr', '<CMD>Pick registers<CR>', { desc = '[M]iniPick [M]arks', silent = true })
vim.keymap.set('n', '<leader>mss', '<CMD>Pick spellsuggest<CR>', { desc = '[M]iniPick [S]pell [S]uggest', silent = true })

return {
  {
    'echasnovski/mini.nvim',
    lazy = false,
    config = function()
      require('mini.diff').setup({
        view = {
          style = 'number',
          priority = 199,
        },
        mappings = {
          -- Apply hunks inside a visual/operator region
          apply = 'gh',

          -- Reset hunks inside a visual/operator region
          reset = 'gH',

          -- Hunk range textobject to be used inside operator
          textobject = 'gh',

          -- Go to hunk range in corresponding direction
          goto_first = 'HH',
          goto_prev = '<h',
          goto_next = '>h',
          goto_last = 'H',
        },
      })
      vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#f38ba8" })
      vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#f9e2af" })
      vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#a6e3a1" })

      -- require('mini.notify').setup()
      -- require('mini.statusline').setup()
      require('mini.extra').setup()
      require('mini.cursorword').setup()
      require('mini.splitjoin').setup()
      require('mini.sessions').setup()
      require('mini.pick').setup()
      require('mini.pairs').setup({
        -- In which modes mappings from this `config` should be created
        modes = { insert = true, command = false, terminal = false },

        -- Global mappings. Each right hand side should be a pair information, a
        -- table with at least these fields (see more in |MiniPairs.map|):
        -- - <action> - one of 'open', 'close', 'closeopen'.
        -- - <pair> - two character string for pair to be used.
        -- By default pair is not inserted after `\`, quotes are not recognized by
        -- `<CR>`, `'` does not insert pair after a letter.
        -- Only parts of tables can be tweaked (others will use these defaults).
        mappings = {
          ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
          ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
          ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

          [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
          [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
          ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

          ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
          ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
          ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
          ['%'] = {
            action = 'closeopen',
            pair = '%%',
            neigh_pattern = '{.$',
            register = { cr = false }
          },
          ['-'] = {
            action = 'closeopen',
            pair = '--',
            neigh_pattern = '%%.',
            register = { cr = false }
          },
          [' '] = {
            action = 'open',
            pair = '  ',
            neigh_pattern = '[{%-%%].'
          },
        },
      })
      -- require('mini.surround').setup()
      require('mini.files').setup({
        windows = {
          preview = true,
          width_preview = 50
        },
        options = {
          use_as_default_explorer = false,
        },
        mappings = {
          close       = 'q',
          go_in       = '<CR>',
          go_in_plus  = 'L',
          go_out      = '-',
          go_out_plus = 'H',
          reset       = '<BS>',
          show_help   = 'g?',
          synchronize = '=',
          trim_left   = '<',
          trim_right  = '>',
        },
      })

      local show_dotfiles = true
      local MiniFiles = require("mini.files")
      local filter_show = function(fs_entry) return true end
      local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
            vim.cmd(direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target_window)
          MiniFiles.go_in({close_on_file = true})
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = 'Split ' .. direction
        vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
          map_split(buf_id, 'gs', 'belowright horizontal')
          map_split(buf_id, 'gv', 'belowright vertical')
        end,
      })
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

}
