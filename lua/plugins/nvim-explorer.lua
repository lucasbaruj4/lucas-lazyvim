return {
  -- Disable neo-tree completely
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Setup nvim-tree with your preferred settings
      require("nvim-tree").setup({
        filters = {
          enable = false,
          dotfiles = false,
          git_ignored = false,
          custom = {},
        },
        git = {
          enable = true,
          ignore = false,
        },
      })
      
      -- Force override the keybinding after setup
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer", noremap = true, silent = true })
    end,
  },
}
