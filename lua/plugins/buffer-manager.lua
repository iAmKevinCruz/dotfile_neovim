-- Keymaps
vim.keymap.set('n', '<M-Space>', ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", { desc = 'Toggle buffer quick menu', silent = true })
vim.keymap.set('n', '<TAB>', ":lua require('buffer_manager.ui').nav_next()<CR>", { desc = 'Buffer next', silent = true })
vim.keymap.set('n', '<S-TAB>', ":lua require('buffer_manager.ui').nav_prev()<CR>", { desc = 'Buffer prev', silent = true })

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
        short_term_names = true
      })
    end
  },
}
