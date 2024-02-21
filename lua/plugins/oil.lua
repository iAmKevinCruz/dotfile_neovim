-- Keymaps
vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>', { desc = '[-] Open Oil directory editor' })

return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
      });
    end
  },
}
