-- Keymaps

return {
  {
    "MunifTanjim/prettier.nvim",
    event = "VeryLazy",
    config = function()
      require("prettier").setup()
    end
  },
}
