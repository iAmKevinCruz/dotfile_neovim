-- Keymaps
vim.keymap.set('n', '<M-Space>', ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", { desc = 'Toggle buffer quick menu', silent = true })
vim.keymap.set('n', '<TAB>', ":lua require('buffer_manager.ui').nav_next()<CR>", { desc = 'Buffer next', silent = true })
vim.keymap.set('n', '<S-TAB>', ":lua require('buffer_manager.ui').nav_prev()<CR>", { desc = 'Buffer prev', silent = true })

vim.api.nvim_set_hl(0, "BufferManagerModified", { fg = "#f5c2e7" })

return {
  {
    'j-morano/buffer_manager.nvim',
    event = "VeryLazy",
    config = function()
      require("buffer_manager").setup({
        select_menu_item_commands = {
          v = {
            key = "<C-v>",
            command = "vsplit"
          },
          h = {
            key = "<C-h>",
            command = "split"
          }
        },
        focus_alternate_buffer = true,
        loop_nav = true,
        width = 90,
        height = 25,
        short_file_names = true,
        short_term_names = true,
        show_indicators = true,
      })

      -- local buffer_manager = require("buffer_manager")
      --
      -- -- Function to get information about a specific buffer by its index
      -- local function get_buffer_info(index)
      --   local marks = buffer_manager.marks
      --
      --   if index < 1 or index > #marks then
      --     return nil
      --   end
      --
      --   local buffer = marks[index]
      --   local filename = buffer.filename
      --   local extension = filename:match("^.+%.(.+)$") or ""
      --
      --   -- Extract just the file name without the path
      --   local file_name = filename:match("([^/\\]+)$") or filename
      --
      --   return {
      --     full_path = filename,
      --     file_name = file_name,
      --     extension = extension,
      --     buf_id = buffer.buf_id
      --   }
      -- end
      --
      -- -- Function to print information about a specific buffer
      -- local function print_buffer_info(index)
      --   local buffer_info, error = get_buffer_info(index)
      --
      --   if error then
      --     -- print(error)
      --     return
      --   end
      --
      --   return buffer_info and (buffer_info.file_name)
      -- end
      --
      -- local function create_goto_keymap(number)
      --   return {
      --     "<leader>" .. number,
      --     function()
      --       require("buffer_manager.ui").nav_file(number)
      --     end,
      --     desc = function()
      --       local element = print_buffer_info(number)
      --       return element and ("Go to " .. element) or "Go to -"
      --     end,
      --   }
      -- end
      --
      -- require("which-key").add({ create_goto_keymap(1), create_goto_keymap(2), create_goto_keymap(3), create_goto_keymap(4), create_goto_keymap(5), create_goto_keymap(6), create_goto_keymap(7) })
      --
      -- -- Example usage
      -- print_buffer_info(1)  -- Print info for the first buffer
    end
  },
}
