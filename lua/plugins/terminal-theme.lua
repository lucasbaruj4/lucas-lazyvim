-- Configure Neovim to use terminal colors
return {
  -- Disable LazyVim's default colorscheme loading
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- Set Neovim to use terminal colors
        vim.cmd("highlight clear")
        vim.cmd("set termguicolors&")
        vim.opt.background = "dark" -- or "light" depending on your terminal theme
      end,
    },
  },
}