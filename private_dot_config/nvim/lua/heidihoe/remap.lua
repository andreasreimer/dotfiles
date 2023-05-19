vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.api.nvim_set_keymap("n", "<F3>", "I## <Space><ESC>\"=strftime('%Y-%m-%d')<CR>P", {})
vim.api.nvim_set_keymap("i", "<F3>", "## <C-R>=strftime('%Y-%m-%d')<Space> <CR>", {})
-- F4 is used
vim.api.nvim_set_keymap("n", "<F5>", ":set list!<CR>", {})
vim.api.nvim_set_keymap("n", "<F6>", ":setlocal spell! spelllang=en<CR>", {})
vim.api.nvim_set_keymap("n", "<F7>", ":setlocal spell! spelllang=de<CR>", {})
vim.api.nvim_set_keymap("n", "<F8>", ":set hlsearch!<CR>", {})

    -- map <F2> <Plug>RStart 
-- vim.keymap.set("n", "<F2>", vim.cmd.Rstart)
-- imap <F2> <Plug>RStart
-- vmap <F2> <Plug>RStart


-- Some stuff from Prime
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
