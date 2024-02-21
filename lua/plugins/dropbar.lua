-- Keymaps
vim.keymap.set('n', '<leader>db', ':lua require("dropbar.api").pick()<CR>', { desc = 'Pick [D]rop[B]ar item' })

return {
  -- {
  --   'Bekaboo/dropbar.nvim',
  --   event = "VeryLazy",
  --   -- optional, but required for fuzzy finder support
  --   dependencies = {
  --     'nvim-telescope/telescope-fzf-native.nvim'
  --   }
  -- },
}
