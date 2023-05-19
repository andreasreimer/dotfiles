--use {
--  "zbirenbaum/copilot.lua",
--  event = "InsertEnter",
--  config = function ()
--    vim.schedule(function()
--      require("copilot").setup()
--    end)
--  end,
--}
---- this should be a comment
---- i want to call copilot on startup


--require('copilot').setup({
--  panel = {
--    enabled = true,
--    auto_refresh = false,
--    keymap = {
--      jump_prev = "[[",
--      jump_next = "]]",
--      accept = "<CR>",
--      refresh = "gr",
--      open = "<M-CR>"
--    },
--  },
--  suggestion = {
--    enabled = true,
--    auto_trigger = false,
--    debounce = 75,
--    keymap = {
--      accept = "<M-l>",
--      accept_word = false,
--      accept_line = false,
--      next = "<M-]>",
--      prev = "<M-[>",
--      dismiss = "<C-]>",
--    },
--  },
--  filetypes = {
--    yaml = false,
--    markdown = false,
--    help = false,
--    gitcommit = false,
--    gitrebase = false,
--    hgcommit = false,
--    svn = false,
--    cvs = false,
--    ["."] = false,
--  },
--  copilot_node_command = 'node', -- Node.js version must be > 16.x
--  server_opts_overrides = {},
--})


--require("copilot.panel").accept()
---- end

---- packer.startup(function()
----    configure_ui()
---- end)

---- packer.use()

---- vim.opt.guicursor = ""
--require("copilot.panel").jump_next()
--require("copilot.panel").jump_prev()
--require("copilot.panel").open()
--require("copilot.panel").refresh()

--require("copilot_cmp").setup {
--  method = "getCompletionsCycling",
--}

---- use {
----   "zbirenbaum/copilot.lua",
----   event = "InsertEnter",
----   config = function ()
----     vim.schedule(function()
----       require("copilot").setup()
----     end)
----   end,
---- }
----
--require("copilot.suggestion").is_visible()
--require("copilot.suggestion").accept()
--require("copilot.suggestion").next()
--require("copilot.suggestion").prev()
--require("copilot.suggestion").dismiss()
--require("copilot.suggestion").toggle_auto_trigger()
----
---- Recommended
--require("copilot_cmp").setup {
--  method = "getCompletionsCycling",
--}


