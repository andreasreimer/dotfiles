vim.opt.listchars = {
  eol = '⤶',
  space = '❤',
  trail = '✚',
  extends = '◀',
  precedes = '▶',
}

vim.opt.linebreak = true

vim.api.nvim_command('set laststatus=3')
vim.api.nvim_command('highlight WinSeparator guibg = None')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = false

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.cmd [[ autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200} ]]

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.linebreak = true

vim.cmd [[
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
]]

--
-- kjlaksjdlfkj sdlfkj asdlfkjsdl ifjseflijs ldifjsld fijasd jsdf sdf jfjspdifjs dfsdf sdjpjjsdf  asd as kl
