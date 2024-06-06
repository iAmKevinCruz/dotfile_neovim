-- Keymaps
vim.keymap.set('n', '<leader>Ha', ':Telescope harpoon marks<cr>', { desc = 'Telescope harpoon files', silent = true })
vim.keymap.set('n', 'Ha', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { desc = 'Open harpoon file menu', silent = true })
vim.keymap.set('n', 'HA', ':lua require("harpoon.mark").add_file()<cr>', { desc = 'Add file to harpoon', silent = true })
vim.keymap.set('n', 'g>', ':lua require("harpoon.ui").nav_next()<cr>', { desc = 'Next harpoon file', silent = true })
vim.keymap.set('n', 'g<', ':lua require("harpoon.ui").nav_prev()<cr>', { desc = 'Prev harpoon file', silent = true })
for i=0,9 do
   vim.keymap.set("n", '<M-'..i ..'>', function ()
        require("harpoon.ui").nav_file(i)
   end)
end

return {
  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
    opts = {},
    config = function()
      require("telescope").load_extension('harpoon');
    end
  },
}
