-- Auto-save configuration
return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- Optional command to toggle auto-save
    event = { "InsertLeave", "TextChanged" }, -- Load on these events
    opts = {
      enabled = true, -- Enable auto-save on startup
      execution_message = {
        enabled = true, -- Enable save notifications to see when files are saved
        message = function() -- Message function for save notifications
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
      },
      trigger_events = { -- Events that trigger auto-save
        immediate_save = { "BufLeave", "FocusLost" }, -- Save immediately on these events
        defer_save = { "InsertLeave", "TextChanged" }, -- Save with debounce on these events
        cancel_deferred_save = { "InsertEnter" }, -- Cancel pending saves on these events
      },
      debounce_delay = 1000, -- Delay in ms before saving (1 second)
      -- Simplified condition without requiring utils
      condition = function(buf)
        local fn = vim.fn
        local buftype = fn.getbufvar(buf, "&buftype")
        local filetype = fn.getbufvar(buf, "&filetype")

        -- Don't save special buffers
        if buftype ~= "" then
          return false
        end

        -- Don't save certain filetypes
        local excluded_filetypes = {
          "neo-tree",
          "neo-tree-popup",
          "notify",
          "TelescopePrompt",
        }

        for _, ft in ipairs(excluded_filetypes) do
          if filetype == ft then
            return false
          end
        end

        -- Check if buffer is modifiable
        if fn.getbufvar(buf, "&modifiable") == 1 then
          return true
        end

        return false
      end,
      write_all_buffers = false, -- Write only current buffer
      clean_command_line_interval = 0, -- Don't show save message in command line
    },
  },
}