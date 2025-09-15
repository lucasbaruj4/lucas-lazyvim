-- Configure blink.cmp to use Tab for accepting completions
return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Configure keymap for blink.cmp
      keymap = {
        -- Tab to accept the completion
        ["<Tab>"] = { "accept", "fallback" },

        -- Keep the default navigation with arrow keys or override with Tab/S-Tab
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },

        -- Optional: Use Shift-Tab for previous item
        ["<S-Tab>"] = { "select_prev", "fallback" },

        -- Disable Enter for accepting (remove this line if you want to keep Enter)
        ["<CR>"] = { "fallback" },

        -- Keep other useful mappings
        ["<C-e>"] = { "cancel", "fallback" },
        ["<C-space>"] = { "show", "fallback" },
      },
    },
  },
}