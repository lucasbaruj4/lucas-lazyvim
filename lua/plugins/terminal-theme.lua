-- Configure Neovim to use terminal background only
return {
  -- Keep LazyVim's default colorscheme but with terminal background
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true, -- This makes the background transparent, showing terminal background
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}