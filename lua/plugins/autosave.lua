-- Auto-save configuration
return {
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" }, -- Load on these events
    opts = {
      enabled = true, -- Enable auto-save on startup
      execution_message = {
        enabled = false, -- Disable save notifications for cleaner experience
      },
      trigger_events = { -- Events that trigger auto-save
        immediate_save = { "BufLeave", "FocusLost" }, -- Save immediately on these events
        defer_save = { "InsertLeave", "TextChanged" }, -- Save with debounce on these events
        cancel_defered_save = { "InsertEnter" }, -- Cancel pending saves on these events
      },
      debounce_delay = 1000, -- Delay in ms before saving (1 second)
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        -- Don't save if file doesn't exist yet
        if fn.getbufvar(buf, "&modifiable") == 1 and
           utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true
        end
        return false
      end,
    },
  },
}