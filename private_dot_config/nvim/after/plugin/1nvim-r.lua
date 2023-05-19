require 'cmp'.setup {
    sources = {
        { name = 'cmp_nvim_r' },
    }
}

require 'cmp_nvim_r'.setup({
    filetypes = { 'r', 'rmd', 'quarto' },
    doc_width = 58
})

-- start R with F2 key
vim.api.nvim_set_keymap("n", "<F2>", "<Plug>RStart", { noremap = true })
vim.api.nvim_set_keymap("i", "<F2>", "<Plug>RStart", { noremap = true })
vim.api.nvim_set_keymap("v", "<F2>", "<Plug>RStart", { noremap = true })



-- R version can be specified like this:
-- vim.g.vimrplugin_r_path = "/usr/local/bin/R"

-- Send selection or line to R with space bar, respectively.
vim.api.nvim_set_keymap("v", "<leader>ss", "<Plug>RDSendSelection", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ss", "<Plug>RDSendLine", { noremap = true })


vim.cmd [[let g:lsp_r_executable = 'R']]
vim.cmd [[let g:lsp_r_root = expand('$R_HOME')]]
-- vim.cmd [[let g:lsp_r_root_patterns = ['^\.Rproj\.user$']]
