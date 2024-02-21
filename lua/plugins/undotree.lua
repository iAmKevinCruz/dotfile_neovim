-- Keymaps
vim.keymap.set('n', '<leader>ut', '<CMD>UndotreeToggle<CR>', { desc = 'Open [U]ndo [T]ree' })

return {
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
}
