-- LazyVim configuration for SCNvim
vim.g.scnvim_postwin_syntax_hl = 1
vim.g.scnvim_scdoc = 1
vim.g.scnvim_postwin_orientation = 'v'
vim.g.scnvim_postwin_direction = 'right'
vim.g.scnvim_postwin_size = 50
vim.g.scnvim_postwin_auto_toggle = 1
vim.g.scnvim_eval_flash_duration = 100
vim.g.scnvim_eval_flash_repeats = 2

vim.cmd [[ highlight SCNvimEval guifg=black guibg=white ctermfg=black ctermbg=white ]]

local function SCNvim_autostart()
  vim.cmd 'SCNvimStart'
end

local function SCNserverboot()
  require('scnvim').map_expr 's.boot'
end

local function delay_call()
  vim.defer_fn(function()
    print 'called SCNvim Autostart'
    SCNvim_autostart()
  end, 1000)
  vim.defer_fn(function()
    print 'Executing SCNserverboot' -- Additional print statement inside the deferred function
    SCNserverboot()
  end, 2500)
end

-- Autocommand to run the function when opening an .scd file
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  pattern = { '*.scd', '*.sc' },
  callback = delay_call,
  group = vim.api.nvim_create_augroup('SCNvimAutostart', { clear = true }),
})

return {
  {
    'davidgranstrom/scnvim',
    config = function()
      require('scnvim').setup {}

      local scnvim = require 'scnvim'
      local map = scnvim.map
      local map_expr = scnvim.map_expr

      scnvim.setup {
        keymaps = {
          ['<leader>pl'] = map('editor.send_line', { 'i', 'n' }),
          ['<leader>pp'] = {
            map('editor.send_block', { 'i', 'n' }),
            map('editor.send_selection', 'x'),
          },
          ['<CR>'] = map 'postwin.toggle',
          ['<M-CR>'] = map('postwin.toggle', 'i'),
          ['<leader>pb'] = map_expr 's.boot',
          -- ['<leader>ps'] = map 'SCNvimStart', -- Assuming SCNvimStart is the correct function name
          -- ['<leader>pr'] = map 'SCNvimRecompile', -- Assuming SCNvimRecompile is the correct function name
          -- ['<M-L>'] = map('postwin.clear', { 'n', 'i' }),
          -- ['<C-k>'] = map('signature.show', { 'n', 'i' }),
          -- ['<F12>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
          -- ['<F9>'] = map_expr 's.meter',
        },
      }
    end,
  },
}
