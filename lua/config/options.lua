-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Word wrap settings - force on everything
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "

-- Force wrap on ALL windows when they're created
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
})

-- Specifically for diff windows (Claude Code diffs)
vim.api.nvim_create_autocmd("FilterWritePre", {
  pattern = "*",
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
})

-- Set wrap when diff mode is enabled
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "diff",
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
})
