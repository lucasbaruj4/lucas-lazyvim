-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "9", "$", { desc = "Go to end of line" })
-- Yank entire file
vim.keymap.set("n", "yA", function()
  vim.cmd(":%y")
end, { desc = "Yank entire file" })
-- Leader and one for grepping root
vim.keymap.set("n", "<leader>1", "<leader>/", { desc = "Grep root", remap = true })

-- F2 to toggle/switch through modes (all modes to normal, normal cycles to insert)
vim.keymap.set("i", "<F2>", "<Esc>", { desc = "Toggle: Exit insert mode to normal" })
vim.keymap.set("n", "<F2>", "i", { desc = "Toggle: Enter insert mode from normal" })
vim.keymap.set("v", "<F2>", "<Esc>", { desc = "Toggle: Exit visual mode to normal" })
vim.keymap.set("t", "<F2>", "<C-\\><C-n>", { desc = "Toggle: Exit terminal mode to normal" })
vim.keymap.set("c", "<F2>", "<C-c>", { desc = "Toggle: Exit command mode to normal" })
vim.keymap.set("s", "<F2>", "<Esc>", { desc = "Toggle: Exit select mode to normal" })
vim.keymap.set("x", "<F2>", "<Esc>", { desc = "Toggle: Exit visual block mode to normal" })
-- Removed operator-pending mode mapping as it conflicts with the O command

-- Custom 'du' mapping for delete until (acts like dt)
vim.keymap.set("n", "du", "dt", { desc = "Delete until character", remap = true })

-- Override <leader>ft to toggle ALL floating terminals at once
vim.keymap.set("n", "<leader>ft", function()
  local Snacks = require("snacks")
  
  -- Handle count prefix for specific terminal
  local count = vim.v.count
  if count > 0 then
    -- If a count is provided, use default behavior for that specific terminal
    Snacks.terminal(nil, { idx = count })
    return
  end
  
  -- Get list of all terminals
  local terminals = Snacks.terminal.list()
  
  if terminals and #terminals > 0 then
    -- Check if any terminal window is visible
    local any_visible = false
    for _, term in ipairs(terminals) do
      -- Check if the terminal has an open window
      if term.win and vim.api.nvim_win_is_valid(term.win) then
        any_visible = true
        break
      end
    end
    
    -- Toggle all terminals based on current state
    if any_visible then
      -- Hide all visible terminals
      for _, term in ipairs(terminals) do
        if term.win and vim.api.nvim_win_is_valid(term.win) then
          term:hide()
        end
      end
    else
      -- Show all hidden terminals
      for _, term in ipairs(terminals) do
        term:show()
      end
    end
  else
    -- No terminals exist, create a new one
    Snacks.terminal()
  end
end, { desc = "Toggle ALL floating terminals" })
