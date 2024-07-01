return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('obsidian').setup {
      workspaces = {
        {
          name = 'personal',
          path = os.getenv 'privobs',
        },
        {
          name = 'work',
          path = os.getenv 'workobs',
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'daily',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%Y-%m-%d',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
      },
      completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- create and toggle checkboxes
        ['<cr>'] = {
          action = function()
            local line = vim.api.nvim_get_current_line()
            if line:match '%s*- %[' then
              require('obsidian').util.toggle_checkbox()
            elseif line:match '%s*-' then
              vim.cmd [[s/-/- [ ]/]]
              vim.cmd.nohlsearch()
            end
          end,
          opts = { buffer = true },
        },
      },
      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,

      vim.keymap.set('n', '<leader>oy', '<cmd>ObsidianYesterday<CR>'),
      vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>'),
      vim.keymap.set('n', '<leader>oT', '<cmd>ObsidianTomorrow<CR>'),
      vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianFollowLink<CR>'),
      vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>'),
      vim.keymap.set('n', '<leader>oi', '<cmd>ObsidianPasteImg<CR>'),
      vim.keymap.set('n', '<leader>of', '<cmd>ObsidianQuickSwitch<CR>'),
      vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>'),
      vim.keymap.set('n', '<leader>ow', '<cmd>ObsidianWorkspace work<CR>'),
      vim.keymap.set('n', '<leader>op', '<cmd>ObsidianWorkspace personal<CR>'),
    }

    vim.wo.conceallevel = 1
  end,
}
