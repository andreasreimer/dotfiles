return {
  -- Harpoon plugin configuration
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    requires = { 'nvim-lua/plenary.nvim' }, -- if harpoon requires this
    config = function()
      require('harpoon').setup {}

      local harpoon = require 'harpoon'
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-f>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-g>', function()
        harpoon:list():select(3)
      end)
    end,
  },
}
